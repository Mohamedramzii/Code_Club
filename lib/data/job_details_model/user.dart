class User {
  dynamic bio;
  dynamic website;
  String? joinedAt;
  String? email;
  dynamic phoneNumber;
  dynamic banner;
  dynamic image;
  String? username;
  dynamic skills;
  String? slug;

  User({
    this.bio,
    this.website,
    this.joinedAt,
    this.email,
    this.phoneNumber,
    this.banner,
    this.image,
    this.username,
    this.skills,
    this.slug,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        bio: json['bio'] as dynamic,
        website: json['website'] as dynamic,
        joinedAt: json['joined_at'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic,
        banner: json['banner'] as dynamic,
        image: json['image'] as dynamic,
        username: json['username'] as String?,
        skills: json['skills'] as dynamic,
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
        'username': username,
        'skills': skills,
        'slug': slug,
      };
}
