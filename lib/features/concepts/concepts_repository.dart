import 'concept_model.dart';

class ConceptsRepository {
  ConceptsRepository._();

  static final instance = ConceptsRepository._();

  static const _concepts = <ConceptModel>[
    ConceptModel(
      id: 'logic',
      title: 'Logica de programacao',
      description: 'Fundamentos para resolver problemas com algoritmos.',
      difficulty: 'Iniciante',
      estimatedMinutes: 12,
      objectives: [
        'Identificar entrada, processamento e saida de um problema.',
        'Organizar uma solucao em passos antes de escrever codigo.',
      ],
      explanation:
          'Programar comeca por decompor um problema. Um algoritmo e uma sequencia finita de instrucoes claras. Antes da linguagem, descreva o que entra, o que deve ser calculado e qual resultado deve sair.',
      exampleCode: '''# Problema: calcular a idade no proximo ano
idade = 18
idade_no_proximo_ano = idade + 1
print(idade_no_proximo_ano)''',
      exampleExplanation:
          'A entrada e `idade`, o processamento soma 1 e a saida e impressa. Essa estrutura aparece em quase todo programa.',
      guidedSteps: [
        'Leia o enunciado e sublinhe os dados recebidos.',
        'Escreva a transformacao necessaria em linguagem natural.',
        'Defina a saida esperada antes de implementar.',
      ],
      checkpointQuestion:
          'Em um programa que calcula media de notas, quais sao entrada e saida?',
      checkpointAnswer:
          'As notas sao as entradas; a media calculada e a saida.',
      nextTopic: 'Variaveis e tipos',
    ),
    ConceptModel(
      id: 'variables',
      title: 'Variaveis e tipos',
      description: 'Como armazenar e transformar dados durante a execucao.',
      difficulty: 'Iniciante',
      estimatedMinutes: 15,
      objectives: [
        'Criar variaveis com nomes significativos.',
        'Diferenciar texto, numero inteiro, decimal e booleano.',
      ],
      explanation:
          'Variaveis guardam valores que seu algoritmo precisa consultar ou atualizar. Em Python, o tipo e inferido pelo valor atribuido. Escolha nomes que expliquem o papel do dado, como `total_pontos` em vez de `x`.',
      exampleCode: '''nome = "Lia"
tentativas = 3
taxa_acerto = 0.85
aprovada = taxa_acerto >= 0.7
print(nome, aprovada)''',
      exampleExplanation:
          '`nome` e texto, `tentativas` e inteiro, `taxa_acerto` e decimal e `aprovada` recebe um booleano resultante de uma comparacao.',
      guidedSteps: [
        'Crie uma variavel para seu nome e outra para sua idade.',
        'Calcule quantos anos tera daqui a cinco anos.',
        'Imprima uma frase usando os valores armazenados.',
      ],
      checkpointQuestion:
          'Por que `total_pontos` e melhor nome que `tp` para uma variavel?',
      checkpointAnswer:
          'Porque comunica a intencao do valor e torna o codigo mais facil de manter.',
      nextTopic: 'Entrada e saida',
    ),
    ConceptModel(
      id: 'input-output',
      title: 'Entrada e saida',
      description: 'Receba dados do usuario e apresente resultados claros.',
      difficulty: 'Iniciante',
      estimatedMinutes: 12,
      objectives: [
        'Usar `input()` para coletar dados.',
        'Converter texto recebido para tipos numericos.',
      ],
      explanation:
          'Toda entrada digitada em Python chega inicialmente como texto. Para fazer calculos, converta com `int()` ou `float()`. Saidas devem explicar o resultado, nao apenas exibir numeros soltos.',
      exampleCode: '''nota1 = float(input("Nota 1: "))
nota2 = float(input("Nota 2: "))
media = (nota1 + nota2) / 2
print(f"Media final: {media:.1f}")''',
      exampleExplanation:
          'As entradas sao convertidas para decimal e a formatacao limita a exibicao a uma casa decimal.',
      guidedSteps: [
        'Pergunte o nome do usuario.',
        'Leia duas idades numericas.',
        'Mostre a soma em uma frase completa.',
      ],
      checkpointQuestion:
          'O que acontece ao somar `input("A: ")` com `input("B: ")` sem conversao?',
      checkpointAnswer:
          'Os textos sao concatenados em vez de somados numericamente.',
      nextTopic: 'Condicionais',
    ),
    ConceptModel(
      id: 'conditions',
      title: 'Condicionais',
      description: 'Como tomar decisoes usando regras booleanas.',
      difficulty: 'Basico',
      estimatedMinutes: 18,
      objectives: [
        'Aplicar `if`, `elif` e `else` em regras de decisao.',
        'Construir expressoes com comparadores e operadores logicos.',
      ],
      explanation:
          'Condicionais permitem que o programa siga caminhos diferentes. A ordem das regras importa: verifique primeiro os casos mais especificos ou prioritarios para que nenhuma decisao seja escondida por outra.',
      exampleCode: '''media = 7.5
frequencia = 80

if media >= 7 and frequencia >= 75:
    print("Aprovado")
elif media >= 5:
    print("Recuperacao")
else:
    print("Reprovado")''',
      exampleExplanation:
          'O aluno so e aprovado quando satisfaz as duas regras; caso contrario a segunda decisao e avaliada.',
      guidedSteps: [
        'Defina uma variavel com a pontuacao obtida.',
        'Imprima `Nivel concluido` para pontuacao maior ou igual a 80.',
        'Acrescente mensagens para recuperacao e nova tentativa.',
      ],
      checkpointQuestion: 'Quando usar `and` em uma decisao?',
      checkpointAnswer:
          'Quando todas as condicoes relacionadas precisam ser verdadeiras ao mesmo tempo.',
      nextTopic: 'Lacos de repeticao',
    ),
    ConceptModel(
      id: 'loops',
      title: 'Lacos de repeticao',
      description: 'Execute passos repetidos de modo controlado.',
      difficulty: 'Basico',
      estimatedMinutes: 20,
      objectives: [
        'Percorrer sequencias usando `for`.',
        'Repetir enquanto uma condicao for verdadeira usando `while`.',
      ],
      explanation:
          'Lacos evitam copiar a mesma instrucao diversas vezes. Use `for` quando conhece a colecao ou quantidade de repeticoes. Use `while` quando a parada depende de uma condicao que muda durante a execucao.',
      exampleCode: '''acertos = [True, False, True, True]
total = 0

for acertou in acertos:
    if acertou:
        total += 1

print(f"Acertos: {total}")''',
      exampleExplanation:
          'O `for` visita cada resultado e o acumulador aumenta somente quando a resposta foi correta.',
      guidedSteps: [
        'Use `range(1, 6)` para exibir numeros de 1 a 5.',
        'Crie um acumulador para somar esses numeros.',
        'Mostre o total ao terminar o laco.',
      ],
      checkpointQuestion:
          'Qual laco e adequado para pedir senha ate ela estar correta?',
      checkpointAnswer:
          '`while`, porque nao sabemos antecipadamente quantas tentativas serao necessarias.',
      nextTopic: 'Funcoes',
    ),
    ConceptModel(
      id: 'functions',
      title: 'Funcoes',
      description: 'Organize regras reutilizaveis com parametros e retorno.',
      difficulty: 'Intermediario',
      estimatedMinutes: 22,
      objectives: [
        'Definir funcoes com parametros.',
        'Retornar resultados para reutilizar a logica.',
      ],
      explanation:
          'Uma funcao nomeia uma responsabilidade. Ela recebe parametros, executa uma regra e pode retornar um resultado. Funcoes curtas tornam o programa mais testavel e reduzem repeticao.',
      exampleCode: '''def calcular_media(notas):
    return sum(notas) / len(notas)

media = calcular_media([8.0, 7.5, 9.0])
print(f"Media: {media:.1f}")''',
      exampleExplanation:
          'A funcao encapsula o calculo; qualquer lista de notas pode reaproveitar a mesma regra.',
      guidedSteps: [
        'Crie `dobro(numero)` que retorne o dobro recebido.',
        'Chame a funcao com tres numeros diferentes.',
        'Crie uma funcao que informe se a nota foi aprovada.',
      ],
      checkpointQuestion:
          'Qual e a diferenca entre `print()` e `return` dentro de uma funcao?',
      checkpointAnswer:
          '`print()` apenas exibe; `return` entrega o valor para ser usado em outras operacoes.',
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
