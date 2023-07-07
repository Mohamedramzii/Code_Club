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

//Email request States

class EmailRequestSuccessState extends AppState {}

class EmailRequestLoadingState extends AppState {}

class EmailRequestFailureState extends AppState {
  final String errMessage;
  EmailRequestFailureState({
    required this.errMessage,
  });
}

//OTP States
class OTPSuccessState extends AppState {}

class OTPLoadingState extends AppState {}

class OTPFailureState extends AppState {
  final String errMessage;
  OTPFailureState({
    required this.errMessage,
  });
}

//Reset password States
class ResetPasswordLoadingState extends AppState {}

class ResetPasswordSuccessState extends AppState {}

class ResetPasswordFailureState extends AppState {
  final String errMessage;
  ResetPasswordFailureState({
    required this.errMessage,
  });
}


//Nav Bar states
class NavBarSuccessState extends AppState {}
