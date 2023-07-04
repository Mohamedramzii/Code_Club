class LoginModel {
  String message;
  int id;
  String token;

  LoginModel({
    required this.message,
    required this.id,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "token": token,
      };
}
