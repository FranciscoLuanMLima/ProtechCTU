import 'concept_model.dart';

class ConceptsRepository {
  ConceptsRepository._();

  static final instance = ConceptsRepository._();

  Future<List<ConceptModel>> load() async {
    return const [
      ConceptModel(
        id: 'logic',
        title: 'Logica de programacao',
        description: 'Fundamentos para resolver problemas com algoritmos.',
      ),
      ConceptModel(
        id: 'variables',
        title: 'Variaveis',
        description: 'Como armazenar e transformar dados durante a execucao.',
      ),
      ConceptModel(
        id: 'conditions',
        title: 'Condicionais',
        description: 'Como tomar decisoes usando regras booleanas.',
      ),
    ];
  }
}
