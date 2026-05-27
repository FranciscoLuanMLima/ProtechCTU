class CodeExecutionResult {
  const CodeExecutionResult.success(this.output)
    : succeeded = true,
      error = null;

  const CodeExecutionResult.failure(this.error)
    : succeeded = false,
      output = '';

  final bool succeeded;
  final String output;
  final String? error;
}

class PythonExerciseRunner {
  const PythonExerciseRunner();

  CodeExecutionResult run({required String code, String input = ''}) {
    try {
      final runtime = _PythonRuntime(code: code, input: input);
      return CodeExecutionResult.success(runtime.execute());
    } on _ExecutionError catch (error) {
      return CodeExecutionResult.failure(error.message);
    } catch (_) {
      return const CodeExecutionResult.failure(
        'Não foi possível executar este código no ambiente didático.',
      );
    }
  }
}

class _PythonRuntime {
  _PythonRuntime({required String code, required String input})
    : _lines = code.replaceAll('\r\n', '\n').split('\n'),
      _input = input.replaceAll('\r\n', '\n').split('\n');

  static const _maxLines = 120;
  static const _maxOperations = 1000;
  static const _maxOutputLength = 4000;

  final List<String> _lines;
  final List<String> _input;
  final _variables = <String, Object?>{};
  final _functions = <String, _UserFunction>{};
  final _output = <String>[];
  var _inputIndex = 0;
  var _operations = 0;

  String execute() {
    if (_lines.length > _maxLines) {
      throw const _ExecutionError(
        'O código excede o limite de 120 linhas para esta atividade.',
      );
    }
    _executeBlock(0, _lines.length, 0, _variables, canReturn: false);
    return _output.join('\n');
  }

  _BlockResult _executeBlock(
    int start,
    int end,
    int indent,
    Map<String, Object?> variables, {
    required bool canReturn,
  }) {
    var index = start;
    while (index < end) {
      final source = _lines[index];
      final text = source.trim();
      if (text.isEmpty || text.startsWith('#')) {
        index++;
        continue;
      }
      final lineIndent = _indentOf(source, index);
      if (lineIndent != indent) {
        throw _lineError(index, 'Indentação inválida.');
      }
      _countOperation();

      if (text == 'try:') {
        final bodyIndent = _bodyIndent(index, end, indent);
        final blockEnd = _blockEnd(index + 1, end, indent);
        final exceptIndex = _nextMeaningfulLine(blockEnd, end);
        if (exceptIndex >= end ||
            _indentOf(_lines[exceptIndex], exceptIndex) != indent ||
            _lines[exceptIndex].trim() != 'except ValueError:') {
          throw _lineError(index, 'Use `except ValueError:` apos `try`.');
        }
        final exceptIndent = _bodyIndent(exceptIndex, end, indent);
        final exceptEnd = _blockEnd(exceptIndex + 1, end, indent);
        try {
          _executeBlock(
            index + 1,
            blockEnd,
            bodyIndent,
            variables,
            canReturn: canReturn,
          );
        } on _ExecutionError {
          _executeBlock(
            exceptIndex + 1,
            exceptEnd,
            exceptIndent,
            variables,
            canReturn: canReturn,
          );
        }
        index = exceptEnd;
        continue;
      }

      if (text.startsWith('def ')) {
        final match = RegExp(
          r'^def\s+([A-Za-z_]\w*)\s*\(([^)]*)\)\s*:$',
        ).firstMatch(text);
        if (match == null) {
          throw _lineError(index, 'Declaração de função inválida.');
        }
        final bodyIndent = _bodyIndent(index, end, indent);
        final blockEnd = _blockEnd(index + 1, end, indent);
        final parameters = match
            .group(2)!
            .split(',')
            .map((value) => value.trim())
            .where((value) => value.isNotEmpty)
            .toList(growable: false);
        _functions[match.group(1)!] = _UserFunction(
          parameters: parameters,
          start: index + 1,
          end: blockEnd,
          indent: bodyIndent,
        );
        index = blockEnd;
        continue;
      }

      if (text.startsWith('if ')) {
        index = _executeConditional(index, end, indent, variables, canReturn);
        continue;
      }

      if (text.startsWith('for ')) {
        final match = RegExp(
          r'^for\s+([A-Za-z_]\w*)\s+in\s+(.+)\s*:$',
        ).firstMatch(text);
        if (match == null) {
          throw _lineError(index, 'Laço `for` inválido.');
        }
        final iterable = _evaluate(match.group(2)!, variables);
        if (iterable is! List<Object?>) {
          throw _lineError(index, 'O `for` precisa percorrer uma lista.');
        }
        final bodyIndent = _bodyIndent(index, end, indent);
        final blockEnd = _blockEnd(index + 1, end, indent);
        for (final value in iterable) {
          _countOperation();
          variables[match.group(1)!] = value;
          final result = _executeBlock(
            index + 1,
            blockEnd,
            bodyIndent,
            variables,
            canReturn: canReturn,
          );
          if (result.returned) return result;
        }
        index = blockEnd;
        continue;
      }

      if (text.startsWith('return')) {
        if (!canReturn) {
          throw _lineError(index, '`return` só pode ser usado em uma função.');
        }
        final expression = text.substring('return'.length).trim();
        return _BlockResult.returnValue(
          expression.isEmpty ? null : _evaluate(expression, variables),
        );
      }

      if (text == 'pass') {
        index++;
        continue;
      }

      if (text.startsWith('print(') && text.endsWith(')')) {
        final expression = text.substring(6, text.length - 1);
        final values = expression.trim().isEmpty
            ? <Object?>[]
            : _splitArguments(
                expression,
              ).map((item) => _evaluate(item, variables)).toList();
        _write(values.map(_stringValue).join(' '));
        index++;
        continue;
      }

      final append = RegExp(
        r'^([A-Za-z_]\w*)\.append\((.+)\)$',
      ).firstMatch(text);
      if (append != null) {
        final collection = variables[append.group(1)!];
        if (collection is! List<Object?>) {
          throw _lineError(index, '`append()` requer uma lista.');
        }
        collection.add(_evaluate(append.group(2)!, variables));
        index++;
        continue;
      }

      final assignment = RegExp(
        r'^([A-Za-z_]\w*)\s*(\+=|=)\s*(.+)$',
      ).firstMatch(text);
      if (assignment != null) {
        final name = assignment.group(1)!;
        final value = _evaluate(assignment.group(3)!, variables);
        if (assignment.group(2) == '+=') {
          variables[name] = _add(variables[name], value, index);
        } else {
          variables[name] = value;
        }
        index++;
        continue;
      }

      throw _lineError(
        index,
        'Comando não suportado. Use apenas os recursos apresentados na atividade.',
      );
    }
    return const _BlockResult.continueExecution();
  }

  int _executeConditional(
    int index,
    int end,
    int indent,
    Map<String, Object?> variables,
    bool canReturn,
  ) {
    var branchIndex = index;
    var branchExecuted = false;
    while (branchIndex < end) {
      final header = _lines[branchIndex].trim();
      final isElse = header == 'else:';
      final conditionMatch = RegExp(
        r'^(if|elif)\s+(.+)\s*:$',
      ).firstMatch(header);
      if (!isElse && conditionMatch == null) {
        break;
      }
      final bodyIndent = _bodyIndent(branchIndex, end, indent);
      final blockEnd = _blockEnd(branchIndex + 1, end, indent);
      final shouldRun =
          !branchExecuted &&
          (isElse || _asBool(_evaluate(conditionMatch!.group(2)!, variables)));
      if (shouldRun) {
        branchExecuted = true;
        final result = _executeBlock(
          branchIndex + 1,
          blockEnd,
          bodyIndent,
          variables,
          canReturn: canReturn,
        );
        if (result.returned) {
          throw _ReturnSignal(result.value);
        }
      }
      branchIndex = _nextMeaningfulLine(blockEnd, end);
      if (branchIndex >= end ||
          _indentOf(_lines[branchIndex], branchIndex) != indent ||
          !(_lines[branchIndex].trim().startsWith('elif ') ||
              _lines[branchIndex].trim() == 'else:')) {
        return blockEnd;
      }
    }
    return branchIndex;
  }

  Object? _evaluate(String expression, Map<String, Object?> variables) {
    final value = expression.trim();
    if (value.isEmpty) return '';
    if (_isWrapped(value, '(', ')')) {
      final inner = value.substring(1, value.length - 1);
      final parts = _splitArguments(inner);
      if (parts.length > 1) {
        return _TupleValue(
          parts.map((item) => _evaluate(item, variables)).toList(),
        );
      }
      return _evaluate(inner, variables);
    }
    if (value.startsWith('f"') || value.startsWith("f'")) {
      return _interpolate(value.substring(1), variables);
    }
    if (_isStringLiteral(value)) return _unquote(value);
    if (value == 'True') return true;
    if (value == 'False') return false;
    if (value == 'None') return null;
    final number = num.tryParse(value);
    if (number != null) return number;
    if (_isWrapped(value, '[', ']')) {
      final content = value.substring(1, value.length - 1).trim();
      if (content.isEmpty) return <Object?>[];
      return _splitArguments(
        content,
      ).map((item) => _evaluate(item, variables)).toList();
    }
    final indexed = RegExp(r'^([A-Za-z_]\w*)\[(\d+)\]$').firstMatch(value);
    if (indexed != null) {
      final collection = variables[indexed.group(1)!];
      final itemIndex = int.parse(indexed.group(2)!);
      if (collection is List<Object?> && itemIndex < collection.length) {
        return collection[itemIndex];
      }
      if (collection is _TupleValue && itemIndex < collection.values.length) {
        return collection.values[itemIndex];
      }
      throw const _ExecutionError('Indice invalido para a colecao.');
    }

    for (final operator in const ['>=', '<=', '==', '!=', '>', '<']) {
      final operatorIndex = _findTopLevelOperator(value, operator);
      if (operatorIndex >= 0) {
        return _compare(
          _evaluate(value.substring(0, operatorIndex), variables),
          _evaluate(
            value.substring(operatorIndex + operator.length),
            variables,
          ),
          operator,
        );
      }
    }
    for (final operators in const [
      ['+', '-'],
      ['*', '/'],
    ]) {
      final found = _findRightmostTopLevelOperator(value, operators);
      if (found != null) {
        final left = _evaluate(value.substring(0, found.index), variables);
        final right = _evaluate(
          value.substring(found.index + found.operator.length),
          variables,
        );
        return _calculate(left, right, found.operator);
      }
    }

    final call = RegExp(r'^([A-Za-z_]\w*)\s*\((.*)\)$').firstMatch(value);
    if (call != null) {
      return _callFunction(call.group(1)!, call.group(2)!, variables);
    }
    if (variables.containsKey(value)) return variables[value];
    throw _ExecutionError('Nome `$value` não foi definido.');
  }

  Object? _callFunction(
    String name,
    String argumentText,
    Map<String, Object?> variables,
  ) {
    final arguments = argumentText.trim().isEmpty
        ? <Object?>[]
        : _splitArguments(
            argumentText,
          ).map((item) => _evaluate(item, variables)).toList();
    switch (name) {
      case 'input':
        if (arguments.isNotEmpty) {
          throw const _ExecutionError(
            'Use `input()` sem mensagem nesta prática.',
          );
        }
        if (_inputIndex >= _input.length ||
            (_inputIndex == _input.length - 1 && _input[_inputIndex].isEmpty)) {
          throw const _ExecutionError(
            'Faltou informar uma entrada para `input()`.',
          );
        }
        return _input[_inputIndex++];
      case 'int':
        if (arguments.length != 1) {
          throw const _ExecutionError('`int()` recebe um valor.');
        }
        final parsed = int.tryParse(_stringValue(arguments.first).trim());
        if (parsed == null) {
          throw const _ExecutionError(
            'Não foi possível converter para inteiro.',
          );
        }
        return parsed;
      case 'float':
        if (arguments.length != 1) {
          throw const _ExecutionError('`float()` recebe um valor.');
        }
        final parsed = double.tryParse(_stringValue(arguments.first).trim());
        if (parsed == null) {
          throw const _ExecutionError(
            'Não foi possível converter para decimal.',
          );
        }
        return parsed;
      case 'len':
        if (arguments.length != 1) {
          throw const _ExecutionError('`len()` recebe uma colecao.');
        }
        final value = arguments.first;
        if (value is List<Object?>) return value.length;
        if (value is _TupleValue) return value.values.length;
        throw const _ExecutionError('`len()` requer lista ou tupla.');
      case 'sum':
      case 'min':
      case 'max':
        if (arguments.length != 1 || arguments.first is! List<Object?>) {
          throw _ExecutionError('`$name()` requer uma lista numerica.');
        }
        final values = (arguments.first as List<Object?>);
        if (values.isEmpty || values.any((item) => item is! num)) {
          throw _ExecutionError('`$name()` requer numeros.');
        }
        final numbers = values.cast<num>();
        if (name == 'sum') {
          return numbers.fold<num>(0, (total, item) => total + item);
        }
        return name == 'min'
            ? numbers.reduce((a, b) => a < b ? a : b)
            : numbers.reduce((a, b) => a > b ? a : b);
      case 'type':
        if (arguments.length != 1) {
          throw const _ExecutionError('`type()` recebe um valor.');
        }
        final value = arguments.first;
        return value is String
            ? 'str'
            : value is int
            ? 'int'
            : value is double
            ? 'float'
            : value is List<Object?>
            ? 'list'
            : value is _TupleValue
            ? 'tuple'
            : 'object';
    }
    final function = _functions[name];
    if (function == null) {
      throw _ExecutionError('Função `$name` não está disponível.');
    }
    if (arguments.length != function.parameters.length) {
      throw _ExecutionError(
        'A função `$name` recebeu uma quantidade inválida de argumentos.',
      );
    }
    final localVariables = <String, Object?>{...variables};
    for (var index = 0; index < function.parameters.length; index++) {
      localVariables[function.parameters[index]] = arguments[index];
    }
    try {
      final result = _executeBlock(
        function.start,
        function.end,
        function.indent,
        localVariables,
        canReturn: true,
      );
      return result.value;
    } on _ReturnSignal catch (signal) {
      return signal.value;
    }
  }

  Object? _calculate(Object? left, Object? right, String operator) {
    if (operator == '+') return _add(left, right, null);
    if (left is! num || right is! num) {
      throw _ExecutionError('O operador `$operator` requer números.');
    }
    return switch (operator) {
      '-' => left - right,
      '*' => left * right,
      '/' =>
        right == 0
            ? throw const _ExecutionError('Divisão por zero.')
            : left / right,
      _ => throw _ExecutionError('Operador `$operator` não suportado.'),
    };
  }

  Object? _add(Object? left, Object? right, int? lineIndex) {
    if (left is num && right is num) return left + right;
    if (left is String && right is String) return left + right;
    throw lineIndex == null
        ? const _ExecutionError('A soma precisa usar valores compatíveis.')
        : _lineError(lineIndex, 'A soma precisa usar valores compatíveis.');
  }

  bool _compare(Object? left, Object? right, String operator) {
    if (operator == '==') return left == right;
    if (operator == '!=') return left != right;
    if (left is! num || right is! num) {
      throw const _ExecutionError('A comparação requer números.');
    }
    return switch (operator) {
      '>=' => left >= right,
      '<=' => left <= right,
      '>' => left > right,
      '<' => left < right,
      _ => false,
    };
  }

  bool _asBool(Object? value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) return value.isNotEmpty;
    if (value is List<Object?>) return value.isNotEmpty;
    return value != null;
  }

  String _interpolate(String literal, Map<String, Object?> variables) {
    final template = _unquote(literal);
    return template.replaceAllMapped(RegExp(r'\{([^{}]+)\}'), (match) {
      return _stringValue(_evaluate(match.group(1)!, variables));
    });
  }

  String _stringValue(Object? value) {
    if (value == null) return 'None';
    if (value is double && value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    if (value is _TupleValue) {
      return '(${value.values.map(_stringValue).join(', ')})';
    }
    return value.toString();
  }

  void _write(String value) {
    final size = _output.fold<int>(0, (total, line) => total + line.length);
    if (size + value.length > _maxOutputLength) {
      throw const _ExecutionError('A saída excedeu o limite permitido.');
    }
    _output.add(value);
  }

  int _bodyIndent(int header, int end, int parentIndent) {
    final next = _nextMeaningfulLine(header + 1, end);
    if (next >= end || _indentOf(_lines[next], next) <= parentIndent) {
      throw _lineError(header, 'Bloco sem instruções.');
    }
    return _indentOf(_lines[next], next);
  }

  int _blockEnd(int start, int end, int parentIndent) {
    for (var index = start; index < end; index++) {
      final text = _lines[index].trim();
      if (text.isEmpty || text.startsWith('#')) continue;
      if (_indentOf(_lines[index], index) <= parentIndent) return index;
    }
    return end;
  }

  int _nextMeaningfulLine(int start, int end) {
    var index = start;
    while (index < end) {
      final text = _lines[index].trim();
      if (text.isNotEmpty && !text.startsWith('#')) return index;
      index++;
    }
    return end;
  }

  int _indentOf(String line, int index) {
    if (line.contains('\t')) {
      throw _lineError(index, 'Use espaços em vez de tabulação.');
    }
    return line.length - line.trimLeft().length;
  }

  void _countOperation() {
    _operations++;
    if (_operations > _maxOperations) {
      throw const _ExecutionError('A execução excedeu o limite permitido.');
    }
  }

  _ExecutionError _lineError(int index, String message) {
    return _ExecutionError('Linha ${index + 1}: $message');
  }

  bool _isStringLiteral(String value) {
    return value.length >= 2 &&
        ((value.startsWith('"') && value.endsWith('"')) ||
            (value.startsWith("'") && value.endsWith("'")));
  }

  String _unquote(String value) {
    if (!_isStringLiteral(value)) {
      throw const _ExecutionError('Texto sem aspas de fechamento.');
    }
    return value
        .substring(1, value.length - 1)
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\"', '"')
        .replaceAll(r"\'", "'");
  }

  bool _isWrapped(String value, String opening, String closing) {
    if (!value.startsWith(opening) || !value.endsWith(closing)) return false;
    return _matchingClosingIndex(value, 0) == value.length - 1;
  }

  int _matchingClosingIndex(String value, int openingIndex) {
    final opening = value[openingIndex];
    final closing = opening == '(' ? ')' : ']';
    var depth = 0;
    var quote = '';
    for (var index = openingIndex; index < value.length; index++) {
      final character = value[index];
      if (quote.isNotEmpty) {
        if (character == quote && value[index - 1] != '\\') quote = '';
        continue;
      }
      if (character == '"' || character == "'") {
        quote = character;
      } else if (character == opening) {
        depth++;
      } else if (character == closing) {
        depth--;
        if (depth == 0) return index;
      }
    }
    return -1;
  }

  List<String> _splitArguments(String value) {
    final items = <String>[];
    var start = 0;
    var roundDepth = 0;
    var squareDepth = 0;
    var quote = '';
    for (var index = 0; index < value.length; index++) {
      final character = value[index];
      if (quote.isNotEmpty) {
        if (character == quote && value[index - 1] != '\\') quote = '';
        continue;
      }
      if (character == '"' || character == "'") {
        quote = character;
      } else if (character == '(') {
        roundDepth++;
      } else if (character == ')') {
        roundDepth--;
      } else if (character == '[') {
        squareDepth++;
      } else if (character == ']') {
        squareDepth--;
      } else if (character == ',' && roundDepth == 0 && squareDepth == 0) {
        items.add(value.substring(start, index).trim());
        start = index + 1;
      }
    }
    items.add(value.substring(start).trim());
    return items;
  }

  int _findTopLevelOperator(String value, String operator) {
    return _findOperator(value, <String>[operator], rightmost: false)?.index ??
        -1;
  }

  _OperatorMatch? _findRightmostTopLevelOperator(
    String value,
    List<String> operators,
  ) {
    return _findOperator(value, operators, rightmost: true);
  }

  _OperatorMatch? _findOperator(
    String value,
    List<String> operators, {
    required bool rightmost,
  }) {
    _OperatorMatch? result;
    var roundDepth = 0;
    var squareDepth = 0;
    var quote = '';
    for (var index = 0; index < value.length; index++) {
      final character = value[index];
      if (quote.isNotEmpty) {
        if (character == quote && value[index - 1] != '\\') quote = '';
        continue;
      }
      if (character == '"' || character == "'") {
        quote = character;
        continue;
      }
      if (character == '(') roundDepth++;
      if (character == ')') roundDepth--;
      if (character == '[') squareDepth++;
      if (character == ']') squareDepth--;
      if (roundDepth != 0 || squareDepth != 0) continue;
      for (final operator in operators) {
        if (value.startsWith(operator, index)) {
          if (operator == '-' &&
              (index == 0 || '+-*/(<>=,'.contains(value[index - 1]))) {
            continue;
          }
          result = _OperatorMatch(index, operator);
          if (!rightmost) return result;
        }
      }
    }
    return result;
  }
}

final class _TupleValue {
  const _TupleValue(this.values);

  final List<Object?> values;
}

class _UserFunction {
  const _UserFunction({
    required this.parameters,
    required this.start,
    required this.end,
    required this.indent,
  });

  final List<String> parameters;
  final int start;
  final int end;
  final int indent;
}

class _BlockResult {
  const _BlockResult.continueExecution() : returned = false, value = null;

  const _BlockResult.returnValue(this.value) : returned = true;

  final bool returned;
  final Object? value;
}

class _OperatorMatch {
  const _OperatorMatch(this.index, this.operator);

  final int index;
  final String operator;
}

class _ReturnSignal implements Exception {
  const _ReturnSignal(this.value);

  final Object? value;
}

class _ExecutionError implements Exception {
  const _ExecutionError(this.message);

  final String message;
}
