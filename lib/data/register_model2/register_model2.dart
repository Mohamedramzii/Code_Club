import 'data.dart';

class RegisterModel2 {
  String? message;
  RegisterData? data;
  String? token;

  RegisterModel2({this.message, this.data, this.token});

  factory RegisterModel2.fromJson(Map<String, dynamic> json) {
    return RegisterModel2(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'token': token,
      };
}
