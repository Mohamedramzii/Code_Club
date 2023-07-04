class RegisterData {
  int? id;
  String? email;
  String? username;
  dynamic phoneNumber;
  dynamic image;
  dynamic location;
  dynamic dateBirth;
  bool? isDoctor;

  RegisterData({
    this.id,
    this.email,
    this.username,
    this.phoneNumber,
    this.image,
    this.location,
    this.dateBirth,
    this.isDoctor,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        id: json['id'] as int?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic,
        image: json['image'] as dynamic,
        location: json['location'] as dynamic,
        dateBirth: json['dateBirth'] as dynamic,
        isDoctor: json['isDoctor'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'image': image,
        'location': location,
        'dateBirth': dateBirth,
        'isDoctor': isDoctor,
      };
}
