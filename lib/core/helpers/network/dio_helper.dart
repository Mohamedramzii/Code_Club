import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://codeclub.pythonanywhere.com/user/',
        headers: {
          'Content-Type': 'application/json',
          // 'lang': 'en',
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': token,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static httpPost({required String email}) async {
    final String apiUrl =
        "https://codeclub.pythonanywhere.com/user/email_request/";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      // "Accept": "application/json",
    };
    Map<String, dynamic> data = {
      "email": email,
    };
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print(response.body);
    } else {
      // Handle error response
      print("Error: ${response.statusCode}");
    }
  }

  static DioPost() async {
    final String apiUrl =
        "https://codeclub.pythonanywhere.com/user/email_request/";

    Map<String, dynamic> data = {
      "email": 'mohamedramzii219@gmail.com',
    };

    try {
      Response response = await Dio().post(
        apiUrl,
        data: data,
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print(response.data);
      } else if (response.statusCode == 400) {
        // Handle error response
        print("Error 400: ${response.data['message']}");
      }
    } catch (e) {
      // Handle DioError

      print("Error: ${e.toString()}");
    }
  }
}
