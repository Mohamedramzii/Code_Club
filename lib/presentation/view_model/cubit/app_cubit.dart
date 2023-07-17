import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/network/dio_helper.dart';
import 'package:job_app/data/register_model2/register_model2.dart';
import 'package:job_app/presentation/views/home_view.dart';
import 'package:job_app/presentation/views/trip_view.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/helpers/local/cache_helper.dart';
import '../../../data/job_details_model/result.dart';
import '../../../data/login_model/login_model.dart';
import '../../../data/userdata_model.dart';
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

  logout() {
    emit(LogoutLoadingState());
    CacheHelper.clearData(key: tokenKey);
    currentIndex = 0;
    emit(LogoutSuccessState());
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
    TripView(),
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

  UserdataModel? userDataModel;
  List skills = [];
  getUserData() async {
    emit(GetUserDataLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: EndPoints.UPDATEUSERDATA, token: 'Token $tokenHolder');
      userDataModel = UserdataModel.fromJson(response.data);
      // userDataModel.skills!.add('dev');
      skills = userDataModel!.skills!;
      print(userDataModel!.skills);
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
      required dynamic updateData,
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

  pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // Open Single File
    final file = result.files.first;
    // openFile(file);
    debugPrint('Name: ${file.name}');
    debugPrint('Bytes: ${file.bytes}');
    debugPrint('Size: ${file.size}');
    debugPrint('Extention: ${file.extension}');
    debugPrint('Path: ${file.path}');

    final newFile = await saveFilePermanently(file);
    debugPrint('Path of newFile: ${newFile.path}');
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

//open multiple files
  FilePickerResult? multipleFileResult;
  void openFilesss(context, ValueChanged<PlatformFile>? onOpenFile,
      List<PlatformFile>? files) async {
    multipleFileResult = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);
    if (multipleFileResult == null) return null;
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => TripView(
    //     files: multipleFileResult.files,
    //     onOpenFile: onOpenFile,
    //   ),
    // ));
    emit(PickAFileSuccessState());
  }

  //Open a single file
  void openFile(PlatformFile platformfile) {
    OpenFile.open(platformfile.path);
  }

  postJobData({
    required String title,
    required dynamic skills,
    required String description,
    required int budget,
    required String time,
  }) async {
    emit(PostJobDataLoadingState());

    try {
      var response = await DioHelper.postData(
        url: EndPoints.job,
        data: {
          "title": title,
          "skills": skills,
          "description": description,
          "budget": budget,
          "time": time,
        },
        token: 'Token $tokenHolder',
      );

      emit(PostJobDataSuccessState(successMessage: response.data['message']));
    } on DioError catch (e) {
      debugPrint('Post Job error Message: ${e.message}');
      debugPrint('Post Job error statusCode: ${e.response!}');
      emit(PostJobDataFailureState(errMessage: e.toString()));
    }
  }

  String? category = 'design';
  int page = 1;

  List<Result> jobs = [];

  getJobs() {
    emit(GetJobDataLoadingState());

    if (jobs.isEmpty) {
      DioHelper.getData(
              url:
                  'https://codeclub.pythonanywhere.com/job/?page=1&category=design',
              token: 'Token $tokenHolder')
          .then((value) {
        print(value.data);
        // resultModel=Result.fromJson(value.data);
        for (var item in value.data['results']) {
          jobs.add(Result.fromJson(item));
        }
        debugPrint('Get Jobs : Success');
        emit(GetJobDataSuccessState());
      }).catchError((e) {
        debugPrint('Get Jobs Error : ${e.toString()} }');
        emit(GetJobDataFailureState(errMessage: e.toString()));
      });
    }
  }

  final int numberofPages = 20;
  int? currentPage = 0;

  changePage(index) {
    currentPage = index + 1;
    emit(ChangeNumberNavigatorSucessState());
  }

  List<String> selectedOptions = [];
  bool? option1 = false;
  selectedOptionsChoices(bool value, String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
      emit(CategoryChoicIsFalseSucessState());
    } else {
      selectedOptions.add(option);
      emit(CategoryChoicIsTrueeSucessState());
    }
  }

  bool? isClickedToChooseCategory = false;

  ClickedToChooseCategory() {
    isClickedToChooseCategory = !isClickedToChooseCategory!;
    emit(IsClickedToChooseCategorySucessState());
  }
}
