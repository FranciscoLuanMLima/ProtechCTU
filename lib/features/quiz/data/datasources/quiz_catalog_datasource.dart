import '../../domain/entities/programming_quiz.dart';

final class QuizCatalogDataSource {
  const QuizCatalogDataSource();

  static const List<ProgrammingQuiz> _catalog = <ProgrammingQuiz>[
    ProgrammingQuiz(
      quizId: 'quiz-variables',
      topicId: 'variables',
      title: 'Variaveis e tipos',
      description: 'Teste rapido sobre dados, atribuicao e conversao.',
      difficulty: QuizDifficulty.beginner,
      xpRewardPerCorrectAnswer: 20,
      coinRewardPerCorrectAnswer: 5,
      perfectBonusXp: 30,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'variables-1',
          prompt:
              'Qual valor sera exibido por `print(idade + 1)` se `idade = 18`?',
          options: <String>['181', '19', 'idade + 1', 'Erro'],
          correctOptionIndex: 1,
          explanation: 'Como `idade` e inteiro, a soma numerica resulta em 19.',
        ),
        QuizQuestion(
          questionId: 'variables-2',
          prompt: 'Qual funcao converte o texto `"42"` em numero inteiro?',
          options: <String>['str()', 'bool()', 'int()', 'print()'],
          correctOptionIndex: 2,
          explanation:
              '`int()` transforma uma representacao numerica em inteiro.',
        ),
        QuizQuestion(
          questionId: 'variables-3',
          prompt: 'Qual nome de variavel comunica melhor seu significado?',
          options: <String>['x', 'a1', 'total_pontos', 'z'],
          correctOptionIndex: 2,
          explanation:
              'Nomes descritivos tornam a regra compreensivel e manutenivel.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-conditions',
      topicId: 'conditions',
      title: 'Condicionais',
      description: 'Decisoes com comparadores, `if`, `elif` e `else`.',
      difficulty: QuizDifficulty.intermediate,
      xpRewardPerCorrectAnswer: 25,
      coinRewardPerCorrectAnswer: 6,
      perfectBonusXp: 35,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'conditions-1',
          prompt:
              'Para aprovar apenas alunos com nota >= 7 e frequencia >= 75, use:',
          options: <String>['or', 'and', 'not', 'while'],
          correctOptionIndex: 1,
          explanation:
              'As duas exigencias devem ser verdadeiras, portanto usa-se `and`.',
        ),
        QuizQuestion(
          questionId: 'conditions-2',
          prompt: 'Em `if nota >= 7:`, qual nota entra nesse bloco?',
          options: <String>['6.9', '5', '7', 'Somente 10'],
          correctOptionIndex: 2,
          explanation: 'O operador `>=` inclui o limite 7.',
        ),
        QuizQuestion(
          questionId: 'conditions-3',
          prompt: 'Qual ramo trata casos que nao atenderam regras anteriores?',
          options: <String>['else', 'import', 'def', 'range'],
          correctOptionIndex: 0,
          explanation:
              '`else` executa quando nenhum teste anterior foi verdadeiro.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-loops-functions',
      topicId: 'loops',
      title: 'Lacos e funcoes',
      description: 'Consolide repeticao, acumuladores e retorno de funcoes.',
      difficulty: QuizDifficulty.advanced,
      xpRewardPerCorrectAnswer: 30,
      coinRewardPerCorrectAnswer: 8,
      perfectBonusXp: 50,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'loops-1',
          prompt: 'Qual estrutura percorre diretamente uma lista de notas?',
          options: <String>['for', 'return', 'elif', 'class'],
          correctOptionIndex: 0,
          explanation: '`for` percorre elementos de uma sequencia.',
        ),
        QuizQuestion(
          questionId: 'functions-1',
          prompt: 'O que `return` faz em uma funcao?',
          options: <String>[
            'Repete o bloco',
            'Entrega um resultado ao chamador',
            'Importa biblioteca',
            'Comenta o codigo',
          ],
          correctOptionIndex: 1,
          explanation: '`return` disponibiliza o resultado para uso posterior.',
        ),
        QuizQuestion(
          questionId: 'loops-2',
          prompt: 'Qual variavel geralmente registra uma soma durante um laco?',
          options: <String>[
            'acumulador',
            'decorador',
            'importador',
            'indice HTML',
          ],
          correctOptionIndex: 0,
          explanation:
              'Um acumulador guarda o total atualizado a cada iteracao.',
        ),
      ],
    ),
  ];

  Future<List<ProgrammingQuiz>> load() async => _catalog;

  Future<ProgrammingQuiz?> findById(String quizId) async {
    for (final quiz in _catalog) {
      if (quiz.quizId == quizId) {
        return quiz;
      }
    }
    return null;
  }
}
