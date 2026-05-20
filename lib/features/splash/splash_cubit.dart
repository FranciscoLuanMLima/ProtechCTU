import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> start() async {
    emit(true);
    await Future<void>.delayed(const Duration(milliseconds: 1900));
    emit(false);
    await Future<void>.delayed(const Duration(milliseconds: 450));
  }
}
