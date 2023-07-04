import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/network/dio_helper.dart';
import 'package:job_app/data/loginModel.dart';
import 'package:job_app/data/register_model2/register_model2.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/local/cache_helper.dart';


part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool isCheckBoxChanged = false;

  checkBox(bool value) {
    isCheckBoxChanged = value;
    emit(CheckBoxChangedSuccessState());
  }

  RegisterModel2? registerModel;
  register(
      {required String email,
      required String username,
      required String password}) {
    emit(RegisterLoadingState());

    DioHelper.postData(url: EndPoints.REGISTER, data: {
      'email': email,
      'username': username,
      'password': password,
    }).then((value) {
      registerModel = RegisterModel2.fromJson(value.data);
      debugPrint(registerModel!.message);
      CacheHelper.saveData(key: tokenKey, value: registerModel!.token);
      // tokenHolder = registerModel!.token;
      emit(RegisterSuccessState());
    }).catchError((e) {
      debugPrint('Register Error: ${e.toString()}');
      emit(RegisterFailureState(errMessage: e.toString()));
    });
  }

  LoginModel? loginModel;
  login({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(url: EndPoints.LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      CacheHelper.saveData(key: tokenKey, value: loginModel!.token);
      // tokenHolder = registerModel!.token;
      emit(LoginSuccessState());
    }).catchError((e) {
      debugPrint('Login Error: ${e.toString()}');
      emit(LoginFailureState(errMessage: e.toString()));
    });
  }
}
