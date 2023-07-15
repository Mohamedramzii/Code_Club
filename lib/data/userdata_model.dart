class UserdataModel {
  dynamic bio;
  dynamic website;
  String? joinedAt;
  String? email;
  dynamic phoneNumber;
  dynamic banner;
  dynamic image;
  String? name;
  List<dynamic>? skills;
  String? slug;

  UserdataModel({
    this.bio,
    this.website,
    this.joinedAt,
    this.email,
    this.phoneNumber,
    this.banner,
    this.image,
    this.name,
    this.skills,
    this.slug,
  });

  factory UserdataModel.fromJson(Map<String, dynamic> json) => UserdataModel(
        bio: json['bio'] as dynamic,
        website: json['website'] as dynamic,
        joinedAt: json['joined_at'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic,
        banner: json['banner'] as dynamic,
        image: json['image'] as dynamic,
        name: json['username'] as String?,
        skills: json['skills'] as List<dynamic>?,
        slug: json['slug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'bio': bio,
        'website': website,
        'joined_at': joinedAt,
        'email': email,
        'phoneNumber': phoneNumber,
        'banner': banner,
        'image': image,
        'username': name,
        'skills': skills,
        'slug': slug,
      };
}
