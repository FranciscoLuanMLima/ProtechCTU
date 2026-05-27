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
    ActivityModel(
      id: 'collections-summary',
      title: 'Resumo de notas',
      language: 'Python',
      description: 'Manipule uma lista e produza uma tupla de extremos.',
      concept: 'Listas e Tuplas',
      difficulty: 'Medio',
      estimatedMinutes: 18,
      objective: 'Usar mutabilidade e agregacoes de colecoes corretamente.',
      problemStatement:
          'Adicione 9.0 a lista [7.0, 8.0] e mostre a tupla formada pela menor e maior nota.',
      steps: [
        'Crie a lista e use append.',
        'Monte a tupla com min e max.',
        'Imprima a tupla final.',
      ],
      exampleInput: 'Sem entrada.',
      exampleOutput: '(7.0, 9.0)',
      starterCode: '''notas = [7.0, 8.0]
# Adicione e apresente os extremos''',
      hints: ['Use `notas.append(9.0)`.', 'Use `(min(notas), max(notas))`.'],
      successCriteria: ['A lista foi atualizada.', 'A saida e uma tupla.'],
    ),
    ActivityModel(
      id: 'safe-input',
      title: 'Entrada de nota segura',
      language: 'Python',
      description: 'Trate entradas que nao podem ser convertidas.',
      concept: 'Tratamento de Excecoes',
      difficulty: 'Medio',
      estimatedMinutes: 20,
      objective: 'Capturar ValueError de maneira especifica.',
      problemStatement:
          'Leia uma nota inteira. Para texto invalido, mostre `Nota invalida`; para valor valido, mostre `Nota: X`.',
      steps: [
        'Coloque int(input()) dentro de try.',
        'Imprima a nota no fluxo valido.',
        'Capture apenas ValueError.',
      ],
      exampleInput: 'oito',
      exampleOutput: 'Nota invalida',
      starterCode: '''try:
    nota = int(input())
    # Mostre a nota
except ValueError:
    # Informe o erro
    pass''',
      hints: ['O bloco except executa quando int falha.'],
      successCriteria: [
        'Tratou ValueError.',
        'Nao interrompe em texto invalido.',
      ],
    ),
    ActivityModel(
      id: 'local-scope',
      title: 'Bonus sem estado global',
      language: 'Python',
      description: 'Refatore uma regra para usar parametros e retorno.',
      concept: 'Escopo de Variaveis',
      difficulty: 'Medio',
      estimatedMinutes: 20,
      objective: 'Evitar alteracao acidental de uma variavel global.',
      problemStatement:
          'Implemente `somar_bonus(pontos, bonus)` e mostre o retorno para 10 e 5.',
      steps: [
        'Defina dois parametros.',
        'Retorne a soma.',
        'Imprima a chamada da funcao.',
      ],
      exampleInput: 'Sem entrada.',
      exampleOutput: '15',
      starterCode: '''def somar_bonus(pontos, bonus):
    # Retorne sem depender de globais
    pass

print(somar_bonus(10, 5))''',
      hints: ['Use `return pontos + bonus`.'],
      successCriteria: ['Nao usou global.', 'Retornou 15.'],
    ),
    ActivityModel(
      id: 'debug-accumulator',
      title: 'Investigue o acumulador',
      language: 'Python',
      description: 'Corrija um total reiniciado no lugar errado.',
      concept: 'Depuracao e Investigacao',
      difficulty: 'Desafio',
      estimatedMinutes: 25,
      objective: 'Rastrear estado intermediario e corrigir a causa do erro.',
      problemStatement:
          'O total deve ser 6 para [1, 2, 3]. Posicione a inicializacao corretamente e mostre `Total: 6`.',
      steps: [
        'Observe onde total e reiniciado.',
        'Inicialize antes do for.',
        'Use print para confirmar o total final.',
      ],
      exampleInput: 'valores = [1, 2, 3]',
      exampleOutput: 'Total: 6',
      starterCode: '''valores = [1, 2, 3]
for valor in valores:
    total = 0
    total += valor
print(f"Total: {total}")''',
      hints: ['A linha `total = 0` deve executar uma unica vez.'],
      successCriteria: [
        'O acumulador nao reinicia no loop.',
        'Mostrou Total: 6.',
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
    try {
      final values =
          HiveService.instance
                  .box(AppConstants.hiveActivitiesBox)
                  .get(_completedKey, defaultValue: <String>[])
              as List;
      return values.cast<String>().contains(id);
    } catch (_) {
      return false;
    }
  }

  Future<void> complete(String id) async {
    final box = HiveService.instance.box(AppConstants.hiveActivitiesBox);
    final completed =
        (box.get(_completedKey, defaultValue: <String>[]) as List)
            .cast<String>()
            .toSet()
          ..add(id);
    await box.put(_completedKey, completed.toList(growable: false));
  }
}
