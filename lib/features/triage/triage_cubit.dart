import 'package:flutter_bloc/flutter_bloc.dart';

import 'triage_state.dart';

class TriageCubit extends Cubit<TriageState> {
  TriageCubit() : super(const TriageState());
}
