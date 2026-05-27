import '../../domain/entities/programming_quiz.dart';

final class QuizCatalogDataSource {
  const QuizCatalogDataSource();

  static const List<ProgrammingQuiz> _catalog = <ProgrammingQuiz>[
    ProgrammingQuiz(
      quizId: 'quiz-variables',
      topicId: 'variables',
      title: 'Variáveis e tipos',
      description: 'Teste rápido sobre dados, atribuição e conversão.',
      difficulty: QuizDifficulty.beginner,
      xpRewardPerCorrectAnswer: 20,
      coinRewardPerCorrectAnswer: 5,
      perfectBonusXp: 30,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'variables-1',
          prompt:
              'Qual valor será exibido por `print(idade + 1)` se `idade = 18`?',
          options: <String>['181', '19', 'idade + 1', 'Erro'],
          correctOptionIndex: 1,
          explanation: 'Como `idade` é inteiro, a soma numérica resulta em 19.',
        ),
        QuizQuestion(
          questionId: 'variables-2',
          prompt: 'Qual função converte o texto `"42"` em número inteiro?',
          options: <String>['str()', 'bool()', 'int()', 'print()'],
          correctOptionIndex: 2,
          explanation:
              '`int()` transforma uma representação numérica em inteiro.',
        ),
        QuizQuestion(
          questionId: 'variables-3',
          prompt: 'Qual nome de variável comunica melhor seu significado?',
          options: <String>['x', 'a1', 'total_pontos', 'z'],
          correctOptionIndex: 2,
          explanation:
              'Nomes descritivos tornam a regra compreensível e manutenível.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-conditions',
      topicId: 'conditions',
      title: 'Condicionais',
      description: 'Decisões com comparadores, `if`, `elif` e `else`.',
      difficulty: QuizDifficulty.intermediate,
      xpRewardPerCorrectAnswer: 25,
      coinRewardPerCorrectAnswer: 6,
      perfectBonusXp: 35,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'conditions-1',
          prompt:
              'Para aprovar apenas alunos com nota >= 7 e frequência >= 75, use:',
          options: <String>['or', 'and', 'not', 'while'],
          correctOptionIndex: 1,
          explanation:
              'As duas exigências devem ser verdadeiras, portanto usa-se `and`.',
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
          prompt: 'Qual ramo trata casos que não atenderam regras anteriores?',
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
      title: 'Laços e funções',
      description: 'Consolide repetição, acumuladores e retorno de funções.',
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
          explanation: '`for` percorre elementos de uma sequência.',
        ),
        QuizQuestion(
          questionId: 'functions-1',
          prompt: 'O que `return` faz em uma função?',
          options: <String>[
            'Repete o bloco',
            'Entrega um resultado ao chamador',
            'Importa biblioteca',
            'Comenta o código',
          ],
          correctOptionIndex: 1,
          explanation: '`return` disponibiliza o resultado para uso posterior.',
        ),
        QuizQuestion(
          questionId: 'loops-2',
          prompt: 'Qual variável geralmente registra uma soma durante um laço?',
          options: <String>[
            'acumulador',
            'decorador',
            'importador',
            'indice HTML',
          ],
          correctOptionIndex: 0,
          explanation:
              'Um acumulador guarda o total atualizado a cada iteração.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-lists-tuples',
      topicId: 'lists-tuples',
      title: 'Listas e Tuplas',
      description: 'Mutabilidade, indices e escolha da colecao correta.',
      difficulty: QuizDifficulty.intermediate,
      xpRewardPerCorrectAnswer: 25,
      coinRewardPerCorrectAnswer: 6,
      perfectBonusXp: 40,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'lists-1',
          prompt: 'Qual operacao adiciona um item ao fim de uma lista `dados`?',
          options: <String>[
            'dados.append(valor)',
            'dados.fixed(valor)',
            'dados = (valor)',
            'tuple.add(valor)',
          ],
          correctOptionIndex: 0,
          explanation: '`append()` altera a lista adicionando o item.',
        ),
        QuizQuestion(
          questionId: 'tuples-1',
          prompt: 'Qual estrutura comunica coordenadas que nao devem mudar?',
          options: <String>['Lista', 'Tupla', 'Entrada', 'Condicional'],
          correctOptionIndex: 1,
          explanation: 'Tuplas representam sequencias imutaveis.',
        ),
        QuizQuestion(
          questionId: 'lists-2',
          prompt: 'Em `[10, 20, 30]`, qual e o valor do indice 1?',
          options: <String>['10', '20', '30', 'Erro'],
          correctOptionIndex: 1,
          explanation: 'Indices comecam em zero; o indice 1 e o segundo item.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-exceptions',
      topicId: 'exceptions',
      title: 'Tratamento de Excecoes',
      description: 'Recuperacao segura de entradas e operacoes invalidas.',
      difficulty: QuizDifficulty.intermediate,
      xpRewardPerCorrectAnswer: 28,
      coinRewardPerCorrectAnswer: 7,
      perfectBonusXp: 45,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'exceptions-1',
          prompt: 'Qual erro `int("abc")` deve ser capturado?',
          options: <String>[
            'ValueError',
            'ZeroDivisionError',
            'IndexError',
            'ImportError',
          ],
          correctOptionIndex: 0,
          explanation: 'O texto nao e uma representacao valida de inteiro.',
        ),
        QuizQuestion(
          questionId: 'exceptions-2',
          prompt: 'Por que usar `except ValueError` em vez de `except:`?',
          options: <String>[
            'Para capturar apenas a falha prevista',
            'Para ignorar todos os bugs',
            'Para repetir para sempre',
            'Para declarar variavel global',
          ],
          correctOptionIndex: 0,
          explanation: 'Captura especifica nao esconde falhas inesperadas.',
        ),
        QuizQuestion(
          questionId: 'exceptions-3',
          prompt: 'Qual erro corresponde a `10 / 0`?',
          options: <String>[
            'ValueError',
            'ZeroDivisionError',
            'NameError',
            'TypeWarning',
          ],
          correctOptionIndex: 1,
          explanation: 'Divisao por zero possui excecao especifica.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-scope',
      topicId: 'scope',
      title: 'Escopo de Variaveis',
      description: 'Valores locais, globais e funcoes previsiveis.',
      difficulty: QuizDifficulty.intermediate,
      xpRewardPerCorrectAnswer: 28,
      coinRewardPerCorrectAnswer: 7,
      perfectBonusXp: 45,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'scope-1',
          prompt:
              'Se `x = 10` fora da funcao e a funcao define `x = 5`, quanto vale o `x` externo?',
          options: <String>['5', '10', '15', 'None'],
          correctOptionIndex: 1,
          explanation: 'A atribuicao interna cria um nome local.',
        ),
        QuizQuestion(
          questionId: 'scope-2',
          prompt: 'Qual desenho evita depender de uma global mutavel?',
          options: <String>[
            'Receber parametro e retornar resultado',
            'Usar muitos prints',
            'Ocultar a variavel',
            'Remover a funcao',
          ],
          correctOptionIndex: 0,
          explanation:
              'Entradas e saidas explicitas reduzem efeitos colaterais.',
        ),
        QuizQuestion(
          questionId: 'scope-3',
          prompt: 'Ler uma local antes de atribui-la dentro da funcao causa:',
          options: <String>[
            'UnboundLocalError',
            'Sucesso automatico',
            'ZeroDivisionError',
            'AppendError',
          ],
          correctOptionIndex: 0,
          explanation:
              'O nome local ainda nao possui valor no ponto de leitura.',
        ),
      ],
    ),
    ProgrammingQuiz(
      quizId: 'quiz-debugging',
      topicId: 'debugging',
      title: 'Depuracao e Investigacao',
      description: 'Rastreie tipos, valores e acumuladores.',
      difficulty: QuizDifficulty.advanced,
      xpRewardPerCorrectAnswer: 35,
      coinRewardPerCorrectAnswer: 9,
      perfectBonusXp: 55,
      questions: <QuizQuestion>[
        QuizQuestion(
          questionId: 'debug-1',
          prompt: 'Qual funcao revela o tipo efetivo de `entrada`?',
          options: <String>[
            'type(entrada)',
            'sum(entrada)',
            'range(entrada)',
            'else(entrada)',
          ],
          correctOptionIndex: 0,
          explanation: '`type()` confirma a representacao recebida.',
        ),
        QuizQuestion(
          questionId: 'debug-2',
          prompt:
              'Um total reinicia em cada iteracao. O que inspecionar primeiro?',
          options: <String>[
            'Onde o acumulador e inicializado',
            'A cor do editor',
            'O nome do arquivo',
            'A rede',
          ],
          correctOptionIndex: 0,
          explanation:
              'A inicializacao dentro do loop descarta o total anterior.',
        ),
        QuizQuestion(
          questionId: 'debug-3',
          prompt: 'Um log estrategico deve:',
          options: <String>[
            'Testar uma hipotese sobre estado ou fluxo',
            'Ser mantido sem objetivo',
            'Substituir todos os testes',
            'Ocultar excecoes',
          ],
          correctOptionIndex: 0,
          explanation: 'Observacao direcionada localiza a origem do desvio.',
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
