import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_model.dart';

class QuestionsCubit extends Cubit<Map<String, String>> {
  QuestionsCubit() : super({});

  final questions = const [
    QuestionModel(
      id: 'level',
      title: 'O quanto voce sabe programar?',
      options: ['Nada', 'Pouco', 'Medio', 'Avancado'],
    ),
    QuestionModel(
      id: 'language',
      title: 'Qual linguagem voce quer aprender?',
      options: ['C++', 'Python', 'JavaScript', 'Java'],
    ),
  ];

  void answer(String questionId, String value) {
    emit({...state, questionId: value});
  }
}
