class UserDataModel {
  String? bio;
  String? name;
  dynamic website;
  String? joinedAt;
  String? email;
  dynamic phoneNumber;
  dynamic banner;
  dynamic image;

  UserDataModel({
    this.bio,
    this.name,
    this.website,
    this.joinedAt,
    this.email,
    this.phoneNumber,
    this.banner,
    this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        bio: json['bio'] as String?,
        name: json['username'] as String?,
        website: json['website'] as dynamic,
        joinedAt: json['joined_at'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic,
        banner: json['banner'] as dynamic,
        image: json['image'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'bio': bio,
        'username': name,
        'website': website,
        'joined_at': joinedAt,
        'email': email,
        'phoneNumber': phoneNumber,
        'banner': banner,
        'image': image,
      };
}
