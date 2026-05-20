import 'package:flutter_bloc/flutter_bloc.dart';

import 'activities_repository.dart';
import 'activity_model.dart';

class ActivitiesCubit extends Cubit<List<ActivityModel>> {
  ActivitiesCubit({ActivitiesRepository? repository})
    : _repository = repository ?? const ActivitiesRepository(),
      super(const []);

  final ActivitiesRepository _repository;

  Future<void> load() async {
    emit(await _repository.load());
  }
}
