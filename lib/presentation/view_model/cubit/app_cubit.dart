import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool isCheckBoxChanged = false;

  checkBox(bool value) {
    isCheckBoxChanged = value;
    emit(CheckBoxChangedSuccessState());
  }
}
