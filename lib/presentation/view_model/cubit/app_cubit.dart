import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/network/dio_helper.dart';
import 'package:job_app/data/register_model2/register_model2.dart';
import 'package:job_app/presentation/views/App_layout.dart';
import 'package:job_app/presentation/views/fakeView.dart';
import 'package:meta/meta.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../core/helpers/local/cache_helper.dart';
import '../../../data/login_model/login_model.dart';
import '../../views/ProfileView.dart';

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
  login({required String email, required String password, required context}) {
    emit(LoginLoadingState());

    DioHelper.postData(url: EndPoints.LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      CacheHelper.saveData(key: tokenKey, value: loginModel!.token);
      Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: const AppLayout(),
          pageAnimationType: BottomToTopTransition()));
      emit(LoginSuccessState());
    }).catchError((e) {
      debugPrint('Login Error: ${e.toString()}');
      emit(LoginFailureState(errMessage: e.toString()));
    });
  }

  String? requestResponseMessage = '';

  emailRequest({required String email}) async {
    emit(EmailRequestLoadingState());

    try {
      Response response = await DioHelper.postData(
          url: EndPoints.EMAIlReQUEST, data: {'email': email});
      requestResponseMessage = response.data['message'];
      debugPrint('Email request Success: ${response.data['message']}');
      emit(EmailRequestSuccessState());
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        debugPrint("Bad Request: ${e.response?.data}");
      } else {
        emit(EmailRequestFailureState(errMessage: e.message.toString()));
        debugPrint("Error: ${e.message}");
      }
    }
  }

  otpCheck({required String email, required String otp, required context}) {
    emit(OTPLoadingState());

    DioHelper.postData(url: EndPoints.OTPReQUEST, data: {
      'email': email,
      'otp': otp,
    }).then((value) {
      Navigator.pop(context);
      emit(OTPSuccessState());
    }).catchError((e) {
      emit(OTPFailureState(errMessage: e.toString()));
    });
  }

  //nav bar
  List<Widget> screens = [
    const FakeView(),
    const ProfileView(),
    const ProfileView(),
    const ProfileView()
  ];

  int currentIndex = 0;

  changeNavBar(int index) {
    currentIndex = index;
    emit(NavBarSuccessState());
  }
}
