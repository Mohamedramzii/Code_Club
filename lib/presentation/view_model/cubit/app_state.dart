part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

//CheckBox
class CheckBoxChangedSuccessState extends AppState {}

//Register States
class RegisterSuccessState extends AppState {}

class RegisterLoadingState extends AppState {}

class RegisterFailureState extends AppState {
  final String errMessage;
  RegisterFailureState({
    required this.errMessage,
  });
}

//Login States
class LoginSuccessState extends AppState {}

class LoginLoadingState extends AppState {}

class LoginFailureState extends AppState {
  final String errMessage;
  LoginFailureState({
    required this.errMessage,
  });
}
