import 'activity_model.dart';

class ActivitiesRepository {
  const ActivitiesRepository();

  Future<List<ActivityModel>> load() async {
    return const [
      ActivityModel(
        id: 'hello-world',
        title: 'Primeiro programa',
        language: 'Python',
        description: 'Escreva um programa que mostre uma mensagem na tela.',
      ),
      ActivityModel(
        id: 'sum',
        title: 'Soma simples',
        language: 'Python',
        description: 'Leia dois numeros e exiba o resultado da soma.',
      ),
    ];
  }
}
