import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_repository.dart';
import 'question_model.dart';

class QuestionsCubit extends Cubit<Map<String, String>> {
  QuestionsCubit({AuthRepository? repository})
    : _repository = repository ?? AuthRepository.instance,
      super((repository ?? AuthRepository.instance).learningPreferences);

  final AuthRepository _repository;

  final questions = const [
    QuestionModel(
      id: 'level',
      title: 'O quanto você sabe programar?',
      options: ['Nada', 'Pouco', 'Médio', 'Avançado'],
    ),
    QuestionModel(
      id: 'language',
      title: 'Qual linguagem você quer aprender?',
      options: ['C++', 'Python', 'JavaScript', 'Java'],
    ),
  ];

  void answer(String questionId, String value) {
    emit({...state, questionId: value});
  }

  Future<void> save() => _repository.saveLearningPreferences(state);
}
