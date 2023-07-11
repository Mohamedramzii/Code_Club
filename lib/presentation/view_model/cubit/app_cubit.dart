import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/network/dio_helper.dart';
import 'package:job_app/data/register_model2/register_model2.dart';
import 'package:job_app/data/user_data_model.dart';
import 'package:job_app/presentation/views/home_view.dart';
import 'package:job_app/presentation/views/trip_view.dart';
import 'package:meta/meta.dart';
import 'package:pdf_render/pdf_render.dart';
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
  login(
      {required String email,
      required String password,
      required context}) async {
    emit(LoginLoadingState());

    try {
      var response = await DioHelper.postData(url: EndPoints.LOGIN, data: {
        'email': email,
        'password': password,
      });
      loginModel = LoginModel.fromJson(response.data);
      debugPrint(loginModel!.message);
      CacheHelper.saveData(key: tokenKey, value: loginModel!.token);
      // var userData = jsonEncode(loginModel);
      // CacheHelper.saveData(key: 'User', value: userData);

      emit(LoginSuccessState());
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error sending email: ${e.response!.data['message']}');
        emit(LoginFailureState(errMessage: e.response!.data['message']));
      } else {
        print('Error sending email: ${e.message}');
      }
    }
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
      emit(OTPSuccessState());
      Navigator.pop(context);
    }).catchError((e) {
      emit(OTPFailureState(errMessage: e.toString()));
    });
  }

  //nav bar
  List<Widget> screens = [
    const HomeView(),
    const TripView(),
    const ProfileView(),
    const ProfileView()
  ];

  int currentIndex = 0;

  changeNavBar(int index) {
    currentIndex = index;
    emit(NavBarSuccessState());
  }

  int categoryCurrentIndex = 0;
  changeCategoriesIndex(index) {
    categoryCurrentIndex = index;
    emit(CategoriesIndexChangeSuccessState());
  }

  UserDataModel? userDataModel;

  // bool isLoaded = false;
  getUserData() async {
    // if (isLoaded == true) {
    //   // Data is already loaded, no need to make a request
    //   debugPrint('Data is Loaded');
    //   emit(GetUserDataSuccessState());
    //   return;
    // }
    // emit(GetUserDataLoadingState());

    emit(GetUserDataLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: EndPoints.UPDATEUSERDATA, token: 'Token $tokenHolder');
      userDataModel = UserDataModel.fromJson(response.data);
      // isLoaded = true;
      // print(isLoaded);
      emit(GetUserDataSuccessState());
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        debugPrint('Get User Data Error: ${e.response!.data['detail']}');
        emit(GetUserDataFailureState(errMessage: e.response!.data['detail']));
      }
    }
  }

  updateUserData(
      {required String dataToChange,
      required String updateData,
      context}) async {
    emit(UpdateUserDataLoadingState());
    try {
      await DioHelper.putData(
          url: EndPoints.UPDATEUSERDATA,
          data: {dataToChange: updateData},
          token: 'Token $tokenHolder');

      emit(UpdateUserDataSuccessState());
    } on DioError catch (e) {
      debugPrint('Update User Data Error : ${e.message}');
      emit(UpdateUserDataFailureState(errMessage: e.message!));
    }
  }

  FilePickerResult? fileResult;
  String? filename;
  PlatformFile? pickedFilePlatform;
  File? fileToDisplay;

  pickFile() async {
    emit(PickAFileLoadingState());
    try {
      fileResult = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        // allowedExtensions: ['pdf'],
        //single file
        allowMultiple: false,
      ))!;
      if (fileResult != null) {
        filename = fileResult!.files.first.name;
        pickedFilePlatform = fileResult!.files.first;
        fileToDisplay = File(fileResult!.files.single.path!);

        document = await PdfDocument.openFile(fileResult!.files.single.path!);
        _loadPageImage();
        debugPrint('FileName: $filename');
        emit(PickAFileSuccessState());
      }
    } catch (e) {
      emit(PickAFileFailureState(errMessage: e.toString()));
    }
  }

  PdfDocument? document;
  PdfPageImage? pageImage;
  int pageNumber = 1;

  Future<void> _loadPageImage() async {
    final page = await document!.getPage(pageNumber);
    final image = await page.render(
      width: 100,
      height: 100,

      // format: PdfPageFormat.JPEG,
    );

    pageImage = image;
    emit(PickPDFsuccessState());
  }
}
