import 'package:flutter_bloc/flutter_bloc.dart';

import 'concept_model.dart';
import 'concepts_repository.dart';

class ConceptsCubit extends Cubit<List<ConceptModel>> {
  ConceptsCubit(this._repository) : super(const []);

  final ConceptsRepository _repository;

  Future<void> load() async {
    emit(await _repository.load());
  }
}
