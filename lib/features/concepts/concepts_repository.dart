import 'concept_model.dart';

class ConceptsRepository {
  ConceptsRepository._();

  static final instance = ConceptsRepository._();

  static const _concepts = <ConceptModel>[
    ConceptModel(
      id: 'logic',
      title: 'Lógica de programação',
      description: 'Fundamentos para resolver problemas com algoritmos.',
      difficulty: 'Iniciante',
      estimatedMinutes: 5,
      objectives: [
        'Identificar entrada, processamento e saída de um problema.',
        'Organizar uma solução em passos antes de escrever código.',
      ],
      explanation:
          'Programar começa por decompor um problema. Um algoritmo é uma sequência finita de instruções claras. Antes da linguagem, descreva o que entra, o que deve ser calculado e qual resultado deve sair.',
      exampleCode: '''# Problema: calcular a idade no próximo ano
idade = 18
idade_no_proximo_ano = idade + 1
print(idade_no_proximo_ano)''',
      exampleExplanation:
          'A entrada é `idade`, o processamento soma 1 e a saída é impressa. Essa estrutura aparece em quase todo programa.',
      guidedSteps: [
        'Leia o enunciado e sublinhe os dados recebidos.',
        'Escreva a transformação necessária em linguagem natural.',
        'Defina a saída esperada antes de implementar.',
      ],
      checkpointQuestion:
          'Em um programa que calcula média de notas, quais são entrada e saída?',
      checkpointAnswer:
          'As notas são as entradas; a média calculada é a saída.',
      nextTopic: 'Variáveis e tipos',
    ),
    ConceptModel(
      id: 'variables',
      title: 'Variáveis e tipos',
      description: 'Como armazenar e transformar dados durante a execução.',
      difficulty: 'Iniciante',
      estimatedMinutes: 5,
      objectives: [
        'Criar variáveis com nomes significativos.',
        'Diferenciar texto, número inteiro, decimal e booleano.',
      ],
      explanation:
          'Variáveis guardam valores que seu algoritmo precisa consultar ou atualizar. Em Python, o tipo é inferido pelo valor atribuído. Escolha nomes que expliquem o papel do dado, como `total_pontos` em vez de `x`.',
      exampleCode: '''nome = "Lia"
tentativas = 3
taxa_acerto = 0.85
aprovada = taxa_acerto >= 0.7
print(nome, aprovada)''',
      exampleExplanation:
          '`nome` é texto, `tentativas` é inteiro, `taxa_acerto` é decimal e `aprovada` recebe um booleano resultante de uma comparação.',
      guidedSteps: [
        'Crie uma variável para seu nome e outra para sua idade.',
        'Calcule quantos anos terá daqui a cinco anos.',
        'Imprima uma frase usando os valores armazenados.',
      ],
      checkpointQuestion:
          'Por que `total_pontos` é melhor nome que `tp` para uma variável?',
      checkpointAnswer:
          'Porque comunica a intenção do valor e torna o código mais fácil de manter.',
      nextTopic: 'Condicionais',
    ),
    ConceptModel(
      id: 'input-output',
      title: 'Entrada e saída',
      description: 'Receba dados do usuário e apresente resultados claros.',
      difficulty: 'Iniciante',
      estimatedMinutes: 5,
      objectives: [
        'Usar `input()` para coletar dados.',
        'Converter texto recebido para tipos numéricos.',
      ],
      explanation:
          'Toda entrada digitada em Python chega inicialmente como texto. Para fazer cálculos, converta com `int()` ou `float()`. Saídas devem explicar o resultado, não apenas exibir números soltos.',
      exampleCode: '''nota1 = float(input("Nota 1: "))
nota2 = float(input("Nota 2: "))
media = (nota1 + nota2) / 2
print(f"Média final: {media:.1f}")''',
      exampleExplanation:
          'As entradas são convertidas para decimal e a formatação limita a exibição a uma casa decimal.',
      guidedSteps: [
        'Pergunte o nome do usuário.',
        'Leia duas idades numéricas.',
        'Mostre a soma em uma frase completa.',
      ],
      checkpointQuestion:
          'O que acontece ao somar `input("A: ")` com `input("B: ")` sem conversão?',
      checkpointAnswer:
          'Os textos são concatenados em vez de somados numericamente.',
      nextTopic: 'Condicionais',
    ),
    ConceptModel(
      id: 'conditions',
      title: 'Condicionais',
      description: 'Como tomar decisões usando regras booleanas.',
      difficulty: 'Básico',
      estimatedMinutes: 5,
      objectives: [
        'Aplicar `if`, `elif` e `else` em regras de decisão.',
        'Construir expressões com comparadores e operadores lógicos.',
      ],
      explanation:
          'Condicionais permitem que o programa siga caminhos diferentes. A ordem das regras importa: verifique primeiro os casos mais específicos ou prioritários para que nenhuma decisão seja escondida por outra.',
      exampleCode: '''media = 7.5
frequencia = 80

if media >= 7 and frequencia >= 75:
    print("Aprovado")
elif media >= 5:
    print("Recuperação")
else:
    print("Reprovado")''',
      exampleExplanation:
          'O aluno só é aprovado quando satisfaz as duas regras; caso contrário a segunda decisão é avaliada.',
      guidedSteps: [
        'Defina uma variável com a pontuação obtida.',
        'Imprima `Nível concluído` para pontuação maior ou igual a 80.',
        'Acrescente mensagens para recuperação e nova tentativa.',
      ],
      checkpointQuestion: 'Quando usar `and` em uma decisão?',
      checkpointAnswer:
          'Quando todas as condições relacionadas precisam ser verdadeiras ao mesmo tempo.',
      nextTopic: 'Laços de repetição',
    ),
    ConceptModel(
      id: 'loops',
      title: 'Laços de repetição',
      description: 'Execute passos repetidos de modo controlado.',
      difficulty: 'Básico',
      estimatedMinutes: 5,
      objectives: [
        'Percorrer sequências usando `for`.',
        'Repetir enquanto uma condição for verdadeira usando `while`.',
      ],
      explanation:
          'Laços evitam copiar a mesma instrução diversas vezes. Use `for` quando conhece a coleção ou quantidade de repetições. Use `while` quando a parada depende de uma condição que muda durante a execução.',
      exampleCode: '''acertos = [True, False, True, True]
total = 0

for acertou in acertos:
    if acertou:
        total += 1

print(f"Acertos: {total}")''',
      exampleExplanation:
          'O `for` visita cada resultado e o acumulador aumenta somente quando a resposta foi correta.',
      guidedSteps: [
        'Use `range(1, 6)` para exibir números de 1 a 5.',
        'Crie um acumulador para somar esses números.',
        'Mostre o total ao terminar o laço.',
      ],
      checkpointQuestion:
          'Qual laço é adequado para pedir senha até ela estar correta?',
      checkpointAnswer:
          '`while`, porque não sabemos antecipadamente quantas tentativas serão necessárias.',
      nextTopic: 'Funções',
    ),
    ConceptModel(
      id: 'functions',
      title: 'Funções',
      description: 'Organize regras reutilizáveis com parâmetros e retorno.',
      difficulty: 'Intermediário',
      estimatedMinutes: 5,
      objectives: [
        'Definir funções com parâmetros.',
        'Retornar resultados para reutilizar a lógica.',
      ],
      explanation:
          'Uma função nomeia uma responsabilidade. Ela recebe parâmetros, executa uma regra e pode retornar um resultado. Funções curtas tornam o programa mais testável e reduzem repetição.',
      exampleCode: '''def calcular_media(notas):
    return sum(notas) / len(notas)

media = calcular_media([8.0, 7.5, 9.0])
print(f"Média: {media:.1f}")''',
      exampleExplanation:
          'A função encapsula o cálculo; qualquer lista de notas pode reaproveitar a mesma regra.',
      guidedSteps: [
        'Crie `dobro(numero)` que retorne o dobro recebido.',
        'Chame a função com três números diferentes.',
        'Crie uma função que informe se a nota foi aprovada.',
      ],
      checkpointQuestion:
          'Qual é a diferença entre `print()` e `return` dentro de uma função?',
      checkpointAnswer:
          '`print()` apenas exibe; `return` entrega o valor para ser usado em outras operações.',
      nextTopic: null,
    ),
  ];

  Future<List<ConceptModel>> load() async => _concepts;

  ConceptModel? findById(String id) {
    for (final concept in _concepts) {
      if (concept.id == id) {
        return concept;
      }
    }
    return null;
  }
}
