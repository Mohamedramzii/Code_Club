import 'user.dart';

class Result {
  int? id;
  User? user;
  String? title;
  dynamic skills;
  dynamic description;
  int? budget;
  dynamic image;
  String? category;
  dynamic time;
  String? createdAt;

  Result({
    this.id,
    this.user,
    this.title,
    this.skills,
    this.description,
    this.budget,
    this.image,
    this.category,
    this.time,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        title: json['title'] as String?,
        skills: (json['skills'] as String?) as dynamic ,
        description: json['description'] as dynamic,
        budget: json['budget'] as int?,
        image: json['image'] as dynamic,
        category: json['category'] as String?,
        time: json['time'] as dynamic,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'title': title,
        'skills': skills,
        'description': description,
        'budget': budget,
        'image': image,
        'category': category,
        'time': time,
        'created_at': createdAt,
      };
}
