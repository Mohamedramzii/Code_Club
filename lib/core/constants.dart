// ignore_for_file: constant_identifier_names

import 'dart:convert';

abstract class EndPoints {
  static const LOGIN = 'login/';
  static const REGISTER = 'register/';
  static const EMAIlReQUEST = 'email_request/';
  static const OTPReQUEST = 'otp_request/';
  static const RESETPASSWORD = 'reset_password/';
  static const UPDATEUSERDATA = 'update/';
  static const job = 'https://codeclub.pythonanywhere.com/job/';
}

String tokenKey = 'token';
String tokenHolder = '';
String jobUsertokenHolder = '';

final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
const jsonString = '''
    {
      "AD": {
        "name": "Andorra",
        "flag": "https://www.countryflags.io/ad/flat/64.png"
      },
      "AE": {
        "name": "United Arab Emirates",
        "flag": "https://www.countryflags.io/ae/flat/64.png"
      },
      "AF": {
        "name": "Afghanistan",
        "flag": "https://www.countryflags.io/af/flat/64.png"
      },
      "EG": {
        "name": "Egypt",
        "flag": "https://www.countryflags.io/eg/flat/64.png"
      }
    }''';
final countryData = jsonDecode(jsonString);
final countryName =
    'Egypt'; // Replace with the country name you want to search for
final flagUrl = getFlagUrl(countryData, countryName);

String getFlagUrl(Map<String, dynamic> countryData, String countryName) {
  for (final entry in countryData.entries) {
    if (entry.value['name'] == countryName) {
      return entry.value['flag'];
    }
  }

  return 'Country Not Found'; // Country not found
}












// Will use it if neccessary

// import 'package:dio/dio.dart';

// void sendEmail(String email) async {
//   Dio dio = Dio();
//   String url = 'https://codeclub.pythonanywhere.com/user/email_request/';

//   try {
//     Response response = await dio.post(
//       url,
//       data: {'email': email},
//     );
//     if (response.statusCode == 200) {
//       print('Email sent successfully');
//     } else {
//       print('Failed to send email');
//     }
//   } on DioError catch (e) {
//     switch (e.type) {
//       case DioErrorType.cancel:
//         print('Request was cancelled');
//         break;
//       case DioErrorType.connectTimeout:
//         print('Connection timeout');
//         break;
//       case DioErrorType.receiveTimeout:
//         print('Receive timeout');
//         break;
//       case DioErrorType.response:
//         print('Response error: ${e.response?.statusCode}');
//         break;
//       case DioErrorType.sendTimeout:
//         print('Send timeout');
//         break;
//       default:
//         print('Unknown error: ${e.message}');
//         break;
//     }
//   }
// }

// UserDataModel? userDataModel;
// bool isLoaded = false;

// getUserData() async {
//   if (isLoaded) {
//     // Data is already loaded, no need to make a request
//     emit(GetUserDataSuccessState());
//     return;
//   }

//   emit(GetUserDataLoadingState());
//   try {
//     // Check if the data is available in the cache
//     FileInfo fileInfo =
//         await DefaultCacheManager().getFileFromCache(EndPoints.UPDATEUSERDATA);
//     if (fileInfo != null && fileInfo.file != null) {
//       // Data is available in the cache, use it
//       userDataModel =
//           UserDataModel.fromJson(await fileInfo.file!.readAsString());
//       isLoaded = true;
//       emit(GetUserDataSuccessState());
//       return;
//     }

//     // Data is not available in the cache, make a request
//     Response response = await DioHelper.getData(
//         url: EndPoints.UPDATEUSERDATA, token: 'Token $tokenHolder');
//     userDataModel = UserDataModel.fromJson(response.data);
//     isLoaded = true;

//     // Store the data in the cache
//     await DefaultCacheManager().putFile(
//         EndPoints.UPDATEUSERDATA, response.data.toString(),
//         fileExtension: '.json');

//     emit(GetUserDataSuccessState());
//   } on DioError catch (e) {
//     if (e.response!.statusCode == 400) {
//       debugPrint('Get User Data Error: ${e.response!.data['detail']}');
//       emit(GetUserDataFailureState(errMessage: e.response!.data['detail']));
//     }
//   }
// }
