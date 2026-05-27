import '../../domain/entities/learning_dashboard.dart';

final class LearningTopicCatalogDataSource {
  const LearningTopicCatalogDataSource();

  List<LearningTopic> load() => _catalog;

  static const List<LearningTopic> _catalog = <LearningTopic>[
    LearningTopic(
      topicId: 'variables',
      name: 'Variaveis e tipos',
      description: 'Valores, conversao e tipos fundamentais em Python.',
      category: 'Fundamentos Python',
      parentTopicId: null,
      prerequisiteTopicIds: <String>[],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
        LearningContentType.quiz,
      ],
      difficulty: TopicDifficulty.easy,
      order: 10,
      totalExercises: 3,
      xpReward: 80,
      coinReward: 15,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Atribuicao e tipo',
          explanation:
              'Uma variavel associa um nome a um valor. Em Python o tipo e determinado em tempo de execucao.',
          exampleCode: 'idade = 18\nprint(type(idade))',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'variables-convert',
          statement: 'Converta o texto "42" em inteiro.',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: 'int("42")',
          explanation: 'int() converte uma representacao numerica valida.',
        ),
      ],
      challenges: <TopicChallenge>[],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-variables',
          name: 'Primeiros Valores',
          requiredMasteryRate: 0.8,
        ),
      ],
      isActive: true,
    ),
    LearningTopic(
      topicId: 'lists-tuples',
      name: 'Listas e Tuplas',
      description: 'Colecoes mutaveis [] e imutaveis () para organizar dados.',
      category: 'Estruturas de Dados',
      parentTopicId: null,
      prerequisiteTopicIds: <String>['variables'],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
        LearningContentType.challenge,
        LearningContentType.quiz,
      ],
      difficulty: TopicDifficulty.medium,
      order: 20,
      totalExercises: 4,
      xpReward: 130,
      coinReward: 25,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Mutabilidade',
          explanation:
              'Listas aceitam inclusao, remocao e substituicao. Tuplas preservam uma sequencia que nao deve mudar.',
          exampleCode:
              'notas = [7.5, 8.0]\nnotas.append(9.0)\ncoordenada = (10, 20)',
        ),
        TopicTheorySection(
          title: 'Indexacao e agregacao',
          explanation:
              'Ambas usam indices; funcoes como len e sum permitem extrair metricas.',
          exampleCode: 'media = sum(notas) / len(notas)\nprint(notas[0])',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'lists-add',
          statement: 'Adicione 9 a lista notas = [7, 8].',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: 'notas.append(9)',
          explanation: 'append altera a lista adicionando ao final.',
        ),
        TopicExercise(
          exerciseId: 'tuples-choice',
          statement: 'Escolha a estrutura para coordenadas fixas.',
          difficulty: TopicDifficulty.medium,
          expectedAnswer: 'tupla',
          explanation: 'Uma tupla explicita que o par nao deve ser alterado.',
        ),
      ],
      challenges: <TopicChallenge>[
        TopicChallenge(
          challengeId: 'lists-average',
          title: 'Media sem alterar historico',
          requirement:
              'Receba uma lista de notas e retorne media e uma tupla (menor, maior).',
          difficulty: TopicDifficulty.medium,
          xpBonus: 45,
        ),
      ],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-collection-curator',
          name: 'Curador de Colecoes',
          requiredMasteryRate: 0.85,
        ),
      ],
      isActive: true,
    ),
    LearningTopic(
      topicId: 'exceptions',
      name: 'Tratamento de Excecoes',
      description: 'Uso de try e except para entradas invalidas e falhas.',
      category: 'Confiabilidade',
      parentTopicId: null,
      prerequisiteTopicIds: <String>['variables'],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
        LearningContentType.challenge,
        LearningContentType.quiz,
      ],
      difficulty: TopicDifficulty.medium,
      order: 30,
      totalExercises: 4,
      xpReward: 150,
      coinReward: 30,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Falhas previsiveis',
          explanation:
              'Converta entradas dentro de try e capture apenas o erro que consegue tratar.',
          exampleCode:
              'try:\n    idade = int(input())\nexcept ValueError:\n    print("Digite um numero inteiro")',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'exceptions-value',
          statement: 'Qual excecao int("abc") produz?',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: 'ValueError',
          explanation: 'O texto nao representa um inteiro valido.',
        ),
        TopicExercise(
          exerciseId: 'exceptions-zero',
          statement: 'Capture o erro gerado por divisao por zero.',
          difficulty: TopicDifficulty.medium,
          expectedAnswer: 'ZeroDivisionError',
          explanation: 'A excecao especifica evita esconder outros defeitos.',
        ),
      ],
      challenges: <TopicChallenge>[
        TopicChallenge(
          challengeId: 'safe-grade-input',
          title: 'Leitor seguro de nota',
          requirement:
              'Leia uma nota decimal e informe erro claro para valor invalido ou fora de 0 a 10.',
          difficulty: TopicDifficulty.hard,
          xpBonus: 55,
        ),
      ],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-error-guardian',
          name: 'Guardiao de Erros',
          requiredMasteryRate: 0.85,
        ),
      ],
      isActive: true,
    ),
    LearningTopic(
      topicId: 'functions',
      name: 'Funcoes',
      description: 'Rotinas reutilizaveis com parametros e retorno.',
      category: 'Fundamentos Python',
      parentTopicId: null,
      prerequisiteTopicIds: <String>['variables'],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
      ],
      difficulty: TopicDifficulty.medium,
      order: 40,
      totalExercises: 3,
      xpReward: 120,
      coinReward: 20,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Parametros e retorno',
          explanation:
              'Funcoes limitam responsabilidades e devolvem resultados.',
          exampleCode: 'def dobro(valor):\n    return valor * 2',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'function-return',
          statement: 'Crie dobro(valor) que retorne valor * 2.',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: 'return valor * 2',
          explanation: 'return disponibiliza o resultado ao chamador.',
        ),
      ],
      challenges: <TopicChallenge>[],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-functions',
          name: 'Construtor de Rotinas',
          requiredMasteryRate: 0.8,
        ),
      ],
      isActive: true,
    ),
    LearningTopic(
      topicId: 'scope',
      name: 'Escopo de Variaveis',
      description: 'Diferenca entre valores locais e globais.',
      category: 'Organizacao de Codigo',
      parentTopicId: null,
      prerequisiteTopicIds: <String>['functions'],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
        LearningContentType.quiz,
      ],
      difficulty: TopicDifficulty.medium,
      order: 50,
      totalExercises: 4,
      xpReward: 150,
      coinReward: 30,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Local antes de global',
          explanation:
              'Uma atribuicao dentro da funcao cria uma variavel local; dados globais devem ser lidos ou alterados intencionalmente.',
          exampleCode:
              'pontos = 10\ndef bonus():\n    pontos = 5\n    return pontos\nprint(pontos)',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'scope-output',
          statement:
              'No exemplo da teoria, qual valor o print fora da funcao exibe?',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: '10',
          explanation: 'A atribuicao interna nao altera pontos global.',
        ),
        TopicExercise(
          exerciseId: 'scope-error',
          statement:
              'Identifique por que ler contador antes de atribui-lo em uma funcao falha.',
          difficulty: TopicDifficulty.medium,
          expectedAnswer: 'UnboundLocalError',
          explanation:
              'A atribuicao torna contador local e ele e lido antes de receber valor.',
        ),
      ],
      challenges: <TopicChallenge>[
        TopicChallenge(
          challengeId: 'scope-refactor',
          title: 'Remova estado global',
          requirement:
              'Refatore uma funcao que altera pontos globais para receber e retornar pontos.',
          difficulty: TopicDifficulty.hard,
          xpBonus: 55,
        ),
      ],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-scope-master',
          name: 'Mestre do Escopo',
          requiredMasteryRate: 0.9,
        ),
      ],
      isActive: true,
    ),
    LearningTopic(
      topicId: 'debugging',
      name: 'Depuracao e Investigacao',
      description: 'print() estrategico, type() e rastreamento de defeitos.',
      category: 'Qualidade',
      parentTopicId: null,
      prerequisiteTopicIds: <String>['exceptions', 'scope'],
      contentTypes: <LearningContentType>[
        LearningContentType.theory,
        LearningContentType.exercise,
        LearningContentType.challenge,
        LearningContentType.quiz,
      ],
      difficulty: TopicDifficulty.hard,
      order: 60,
      totalExercises: 5,
      xpReward: 190,
      coinReward: 40,
      theory: <TopicTheorySection>[
        TopicTheorySection(
          title: 'Hipotese observavel',
          explanation:
              'Inspecione valor e tipo nos limites do fluxo antes de mudar codigo; cada log deve testar uma hipotese.',
          exampleCode:
              'entrada = input()\nprint("entrada:", repr(entrada), type(entrada))',
        ),
      ],
      exercises: <TopicExercise>[
        TopicExercise(
          exerciseId: 'debug-type',
          statement:
              'Qual chamada revela se idade recebida por input ainda e texto?',
          difficulty: TopicDifficulty.easy,
          expectedAnswer: 'type(idade)',
          explanation: 'type exibe a classe efetiva do valor.',
        ),
        TopicExercise(
          exerciseId: 'debug-concat',
          statement: 'Explique o resultado "23" de input 2 + input 3.',
          difficulty: TopicDifficulty.medium,
          expectedAnswer: 'concatenacao de strings',
          explanation: 'input devolve str e precisa ser convertido.',
        ),
      ],
      challenges: <TopicChallenge>[
        TopicChallenge(
          challengeId: 'trace-total',
          title: 'Rastreie o total incorreto',
          requirement:
              'Encontre e corrija um acumulador que reinicia dentro de um for, registrando valores intermediarios.',
          difficulty: TopicDifficulty.hard,
          xpBonus: 70,
        ),
      ],
      badges: <TopicBadge>[
        TopicBadge(
          badgeId: 'badge-debug-detective',
          name: 'Investigador de Bugs',
          requiredMasteryRate: 0.9,
        ),
      ],
      isActive: true,
    ),
  ];
}
