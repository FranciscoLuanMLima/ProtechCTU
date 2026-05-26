import 'activity_model.dart';

class ActivitiesRepository {
  const ActivitiesRepository();

  static const _activities = <ActivityModel>[
    ActivityModel(
      id: 'hello-world',
      title: 'Mensagem de boas-vindas',
      language: 'Python',
      description: 'Use saida de texto para apresentar o ProTech.',
      concept: 'Logica e saida',
      difficulty: 'Facil',
      estimatedMinutes: 8,
      objective: 'Escrever sua primeira instrucao executavel com `print()`.',
      problemStatement:
          'Crie um programa que mostre exatamente a mensagem `Bem-vindo ao ProTech!` na tela.',
      steps: [
        'Localize a funcao usada para exibir texto em Python.',
        'Coloque a mensagem entre aspas.',
        'Execute mentalmente e confira pontuacao e letras.',
      ],
      exampleInput: 'Sem entrada.',
      exampleOutput: 'Bem-vindo ao ProTech!',
      starterCode: '''# Exiba a mensagem solicitada abaixo
print("...")''',
      hints: [
        'A funcao de saida e `print`.',
        'O texto deve estar entre aspas dentro dos parenteses.',
      ],
      successCriteria: [
        'Usou `print()`.',
        'A mensagem tem o mesmo texto e pontuacao do enunciado.',
      ],
    ),
    ActivityModel(
      id: 'sum',
      title: 'Calculadora de pontos',
      language: 'Python',
      description: 'Leia duas pontuacoes e mostre o XP total.',
      concept: 'Variaveis e entrada',
      difficulty: 'Facil',
      estimatedMinutes: 12,
      objective: 'Converter entradas numericas e calcular uma soma.',
      problemStatement:
          'O aluno ganhou XP em duas atividades. Leia dois numeros inteiros e exiba `XP total: X`, substituindo X pela soma.',
      steps: [
        'Leia a primeira e a segunda pontuacao com `input()`.',
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
        'Voce pode usar uma variavel chamada `xp_total`.',
      ],
      successCriteria: [
        'Leu dois numeros inteiros.',
        'Somou os valores, sem concatenar textos.',
        'Mostrou o prefixo `XP total:`.',
      ],
    ),
    ActivityModel(
      id: 'approval',
      title: 'Resultado do modulo',
      language: 'Python',
      description: 'Decida se o estudante concluiu, revisa ou repete.',
      concept: 'Condicionais',
      difficulty: 'Medio',
      estimatedMinutes: 18,
      objective: 'Aplicar regras com `if`, `elif` e `else`.',
      problemStatement:
          'Leia a nota final. Mostre `Concluido` para nota maior ou igual a 7, `Revisao` para nota maior ou igual a 5 e `Refazer` nos demais casos.',
      steps: [
        'Leia a nota usando `float()`.',
        'Teste primeiro a maior faixa: nota maior ou igual a 7.',
        'Adicione a faixa intermediaria e o caso restante.',
      ],
      exampleInput: '6.5',
      exampleOutput: 'Revisao',
      starterCode: '''nota = float(input())

if nota >= 7:
    print("Concluido")
# Complete as demais regras''',
      hints: [
        'Use `elif nota >= 5` apos a primeira regra.',
        'O `else` nao precisa de condicao.',
      ],
      successCriteria: [
        'Tratou as tres faixas de notas.',
        'Testou as regras em ordem correta.',
      ],
    ),
    ActivityModel(
      id: 'streak',
      title: 'Contador de dias estudados',
      language: 'Python',
      description: 'Some praticas realizadas usando repeticao.',
      concept: 'Lacos',
      difficulty: 'Medio',
      estimatedMinutes: 20,
      objective: 'Percorrer uma lista e contar valores validos.',
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
      hints: ['Use `for tempo in minutos:`.', 'A condicao e `tempo > 0`.'],
      successCriteria: [
        'Percorreu todos os dias.',
        'Nao contou dias com zero minutos.',
        'Imprimiu o total esperado.',
      ],
    ),
    ActivityModel(
      id: 'mastery-function',
      title: 'Funcao de maestria',
      language: 'Python',
      description: 'Transforme taxa de acerto em faixa de dominio.',
      concept: 'Funcoes',
      difficulty: 'Desafio',
      estimatedMinutes: 25,
      objective:
          'Criar uma funcao que receba dados e retorne uma classificacao.',
      problemStatement:
          'Implemente `classificar_maestria(taxa)`: retorne `Avancado` para taxa maior ou igual a 0.8, `Em progresso` para taxa maior ou igual a 0.5 e `Revisar` caso contrario.',
      steps: [
        'Defina a funcao com um parametro `taxa`.',
        'Use condicionais para classificar as faixas.',
        'Chame a funcao com `0.72` e imprima o retorno.',
      ],
      exampleInput: '0.72',
      exampleOutput: 'Em progresso',
      starterCode: '''def classificar_maestria(taxa):
    # Retorne a classificacao correta
    pass

print(classificar_maestria(0.72))''',
      hints: [
        'Dentro da funcao, use `return` em cada faixa.',
        'Valores decimais de taxa ficam entre 0 e 1.',
      ],
      successCriteria: [
        'Criou a funcao pedida.',
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
}
