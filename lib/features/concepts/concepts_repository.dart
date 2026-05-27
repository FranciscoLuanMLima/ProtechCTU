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
      estimatedMinutes: 12,
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
      estimatedMinutes: 15,
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
      nextTopic: 'Entrada e saída',
    ),
    ConceptModel(
      id: 'input-output',
      title: 'Entrada e saída',
      description: 'Receba dados do usuário e apresente resultados claros.',
      difficulty: 'Iniciante',
      estimatedMinutes: 12,
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
      estimatedMinutes: 18,
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
      estimatedMinutes: 20,
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
      estimatedMinutes: 22,
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
      nextTopic: 'Listas e Tuplas',
    ),
    ConceptModel(
      id: 'lists-tuples',
      title: 'Listas e Tuplas',
      description: 'Colecoes mutaveis e imutaveis em Python.',
      difficulty: 'Intermediario',
      estimatedMinutes: 22,
      objectives: [
        'Escolher entre lista e tupla conforme a mutabilidade.',
        'Consultar, adicionar e agregar elementos com seguranca.',
      ],
      explanation:
          'Listas usam colchetes e aceitam mudancas com append, remocao ou atribuicao por indice. Tuplas usam parenteses e representam dados que nao devem mudar, como coordenadas.',
      exampleCode: '''notas = [7.0, 8.5]
notas.append(9.0)
coordenada = (10, 20)
print(sum(notas) / len(notas), coordenada[0])''',
      exampleExplanation:
          'A lista recebe uma nova nota; a tupla apenas disponibiliza suas coordenadas fixas.',
      guidedSteps: [
        'Monte uma lista com tres notas e inclua uma quarta.',
        'Calcule media usando sum e len.',
        'Use uma tupla para guardar a menor e a maior nota.',
      ],
      checkpointQuestion: 'Quando uma tupla e melhor que uma lista?',
      checkpointAnswer:
          'Quando a colecao representa dados fixos e nao deve ser modificada.',
      nextTopic: 'Tratamento de Excecoes',
    ),
    ConceptModel(
      id: 'exceptions',
      title: 'Tratamento de Excecoes',
      description: 'Previna falhas em entradas invalidas com try e except.',
      difficulty: 'Intermediario',
      estimatedMinutes: 24,
      objectives: [
        'Capturar ValueError em conversoes.',
        'Exibir uma mensagem util sem esconder defeitos inesperados.',
      ],
      explanation:
          'Entradas do usuario podem nao respeitar o formato esperado. Use try no trecho que pode falhar e except com o tipo exato de erro que seu programa sabe recuperar.',
      exampleCode: '''try:
    idade = int(input("Idade: "))
    print(idade + 1)
except ValueError:
    print("Informe uma idade inteira.")''',
      exampleExplanation:
          'Texto nao numerico produz ValueError e recebe resposta orientadora em vez de encerrar o programa.',
      guidedSteps: [
        'Leia uma nota decimal dentro de try.',
        'Capture ValueError e informe o formato correto.',
        'Valide tambem se a nota esta entre 0 e 10.',
      ],
      checkpointQuestion: 'Por que evitar um except sem tipo?',
      checkpointAnswer:
          'Porque ele pode ocultar erros de programacao que nao sao recuperaveis.',
      nextTopic: 'Escopo de Variaveis',
    ),
    ConceptModel(
      id: 'scope',
      title: 'Escopo de Variaveis',
      description: 'Diferencie dados locais e globais em funcoes.',
      difficulty: 'Intermediario',
      estimatedMinutes: 20,
      objectives: [
        'Prever o valor visivel dentro e fora de uma funcao.',
        'Preferir parametros e retorno a alteracoes globais.',
      ],
      explanation:
          'Atribuir um nome dentro de uma funcao cria um valor local. O valor global com o mesmo nome permanece separado, salvo quando a alteracao e declarada explicitamente.',
      exampleCode: '''pontos = 10
def calcular_bonus():
    pontos = 5
    return pontos
print(calcular_bonus(), pontos)''',
      exampleExplanation:
          'A funcao retorna 5, enquanto a variavel global continua com valor 10.',
      guidedSteps: [
        'Execute mentalmente o exemplo e registre os dois valores.',
        'Reescreva a funcao recebendo pontos como parametro.',
        'Identifique um caso que causaria UnboundLocalError.',
      ],
      checkpointQuestion:
          'Qual estrategia reduz erros causados por estado global?',
      checkpointAnswer:
          'Passar valores como parametros e retornar o resultado calculado.',
      nextTopic: 'Depuracao e Investigacao',
    ),
    ConceptModel(
      id: 'debugging',
      title: 'Depuracao e Investigacao',
      description: 'Investigue bugs com observacoes controladas.',
      difficulty: 'Desafio',
      estimatedMinutes: 26,
      objectives: [
        'Usar print e type para confirmar hipoteses.',
        'Localizar a primeira etapa em que o estado diverge.',
      ],
      explanation:
          'Depurar e observar o fluxo ate encontrar onde um valor deixa de ser o esperado. Registre valor e tipo perto das entradas, conversoes e atualizacoes de acumuladores.',
      exampleCode: '''valor = input("XP: ")
print("recebido:", repr(valor), type(valor))
xp = int(valor)
print("convertido:", xp, type(xp))''',
      exampleExplanation:
          'Os logs mostram primeiro uma string e depois um inteiro, isolando erros de concatenacao.',
      guidedSteps: [
        'Insira logs antes e depois de uma conversao.',
        'Rastreie um acumulador em cada iteracao de um for.',
        'Remova os logs depois de validar a correcao.',
      ],
      checkpointQuestion: 'Qual pergunta um print de depuracao deve responder?',
      checkpointAnswer:
          'Se o valor e o tipo naquele ponto confirmam ou rejeitam uma hipotese.',
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
