import '../../app/constants.dart';
import '../../core/services/hive_service.dart';
import 'activity_model.dart';

class ActivitiesRepository {
  const ActivitiesRepository();

  static const _completedKey = 'completedActivities';
  static const _activities = <ActivityModel>[
    ActivityModel(
      id: 'hello-world',
      title: 'Mensagem de boas-vindas',
      language: 'Python',
      description: 'Use saída de texto para apresentar o ProTech.',
      concept: 'Lógica e saída',
      difficulty: 'Fácil',
      estimatedMinutes: 8,
      objective: 'Escrever sua primeira instrução executável com `print()`.',
      problemStatement:
          'Crie um programa que mostre exatamente a mensagem `Bem-vindo ao ProTech!` na tela.',
      steps: [
        'Localize a função usada para exibir texto em Python.',
        'Coloque a mensagem entre aspas.',
        'Execute mentalmente e confira pontuação e letras.',
      ],
      exampleInput: 'Sem entrada.',
      exampleOutput: 'Bem-vindo ao ProTech!',
      starterCode: '''# Exiba a mensagem solicitada abaixo
print("...")''',
      hints: [
        'A função de saída é `print`.',
        'O texto deve estar entre aspas dentro dos parênteses.',
      ],
      successCriteria: [
        'Usou `print()`.',
        'A mensagem tem o mesmo texto e pontuação do enunciado.',
      ],
    ),
    ActivityModel(
      id: 'sum',
      title: 'Calculadora de pontos',
      language: 'Python',
      description: 'Leia duas pontuações e mostre o XP total.',
      concept: 'Variáveis e entrada',
      difficulty: 'Fácil',
      estimatedMinutes: 12,
      objective: 'Converter entradas numéricas e calcular uma soma.',
      problemStatement:
          'O aluno ganhou XP em duas atividades. Leia dois números inteiros e exiba `XP total: X`, substituindo X pela soma.',
      steps: [
        'Leia a primeira e a segunda pontuação com `input()`.',
        'Converta cada resposta para inteiro usando `int()`.',
        'Some os valores e imprima a frase final.',
      ],
      exampleInput: '40\n25',
      exampleOutput: 'XP total: 65',
      starterCode: '''xp_atividade_1 = int(input())
xp_atividade_2 = int(input())

# Calcule e mostre o total''',
      hints: [
        '`input()` retorna texto; converta antes de somar.',
        'Você pode usar uma variável chamada `xp_total`.',
      ],
      successCriteria: [
        'Leu dois números inteiros.',
        'Somou os valores, sem concatenar textos.',
        'Mostrou o prefixo `XP total:`.',
      ],
    ),
    ActivityModel(
      id: 'approval',
      title: 'Resultado do módulo',
      language: 'Python',
      description: 'Decida se o estudante concluiu, revisa ou repete.',
      concept: 'Condicionais',
      difficulty: 'Médio',
      estimatedMinutes: 18,
      objective: 'Aplicar regras com `if`, `elif` e `else`.',
      problemStatement:
          'Leia a nota final. Mostre `Concluído` para nota maior ou igual a 7, `Revisão` para nota maior ou igual a 5 e `Refazer` nos demais casos.',
      steps: [
        'Leia a nota usando `float()`.',
        'Teste primeiro a maior faixa: nota maior ou igual a 7.',
        'Adicione a faixa intermediária e o caso restante.',
      ],
      exampleInput: '6.5',
      exampleOutput: 'Revisão',
      starterCode: '''nota = float(input())

if nota >= 7:
    print("Concluído")
# Complete as demais regras''',
      hints: [
        'Use `elif nota >= 5` após a primeira regra.',
        'O `else` não precisa de condição.',
      ],
      successCriteria: [
        'Tratou as três faixas de notas.',
        'Testou as regras em ordem correta.',
      ],
    ),
    ActivityModel(
      id: 'streak',
      title: 'Contador de dias estudados',
      language: 'Python',
      description: 'Some práticas realizadas usando repetição.',
      concept: 'Laços',
      difficulty: 'Médio',
      estimatedMinutes: 20,
      objective: 'Percorrer uma lista e contar valores válidos.',
      problemStatement:
          'Dada a lista de minutos estudados na semana, conte quantos dias tiveram estudo maior que zero e mostre `Dias ativos: X`.',
      steps: [
        'Crie um contador inicial igual a zero.',
        'Percorra a lista com `for`.',
        'Aumente o contador somente para minutos maiores que zero.',
      ],
      exampleInput: 'minutos = [20, 0, 15, 30, 0, 10, 25]',
      exampleOutput: 'Dias ativos: 5',
      starterCode: '''minutos = [20, 0, 15, 30, 0, 10, 25]
dias_ativos = 0

# Percorra a lista e conte os dias

print(f"Dias ativos: {dias_ativos}")''',
      hints: ['Use `for tempo in minutos:`.', 'A condição é `tempo > 0`.'],
      successCriteria: [
        'Percorreu todos os dias.',
        'Não contou dias com zero minutos.',
        'Imprimiu o total esperado.',
      ],
    ),
    ActivityModel(
      id: 'mastery-function',
      title: 'Função de maestria',
      language: 'Python',
      description: 'Transforme taxa de acerto em faixa de domínio.',
      concept: 'Funções',
      difficulty: 'Desafio',
      estimatedMinutes: 25,
      objective:
          'Criar uma função que receba dados e retorne uma classificação.',
      problemStatement:
          'Implemente `classificar_maestria(taxa)`: retorne `Avançado` para taxa maior ou igual a 0.8, `Em progresso` para taxa maior ou igual a 0.5 e `Revisar` caso contrário.',
      steps: [
        'Defina a função com um parâmetro `taxa`.',
        'Use condicionais para classificar as faixas.',
        'Chame a função com `0.72` e imprima o retorno.',
      ],
      exampleInput: '0.72',
      exampleOutput: 'Em progresso',
      starterCode: '''def classificar_maestria(taxa):
    # Retorne a classificação correta
    pass

print(classificar_maestria(0.72))''',
      hints: [
        'Dentro da função, use `return` em cada faixa.',
        'Valores decimais de taxa ficam entre 0 e 1.',
      ],
      successCriteria: [
        'Criou a função pedida.',
        'Retornou uma resposta para cada faixa.',
        'A chamada de exemplo produz `Em progresso`.',
      ],
    ),
  ];

  Future<List<ActivityModel>> load() async => _activities;

  ActivityModel? findById(String id) {
    for (final activity in _activities) {
      if (activity.id == id) {
        return activity;
      }
    }
    return null;
  }

  bool isCompleted(String id) {
    return legacyCompletedIds().contains(id);
  }

  Set<String> legacyCompletedIds() {
    try {
      final values =
          HiveService.instance
                  .box(AppConstants.hiveActivitiesBox)
                  .get(_completedKey, defaultValue: <String>[])
              as List;
      return values.cast<String>().toSet();
    } catch (_) {
      return const <String>{};
    }
  }
}
