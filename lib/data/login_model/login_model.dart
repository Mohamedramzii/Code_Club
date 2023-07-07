import 'data.dart';

class LoginModel {
  String? message;
  int? id;
  LoginData? data;
  String? token;

  LoginModel({this.message, this.id, this.data, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json['message'] as String?,
        id: json['id'] as int?,
        data: json['data'] == null
            ? null
            : LoginData.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'id': id,
        'data': data?.toJson(),
        'token': token,
      };
}
