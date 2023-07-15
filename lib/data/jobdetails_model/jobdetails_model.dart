class JobdetailsModel {
  int? id;
  String? title;
  String? skills;
  String? description;
  int? budget;

  String? time;
  String? createdAt;

  JobdetailsModel({
    this.id,
    this.title,
    this.skills,
    this.description,
    this.budget,
    this.time,
    this.createdAt,
  });

  factory JobdetailsModel.fromJson(Map<String, dynamic> json) {
    return JobdetailsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      skills: json['skills'] as String?,
      description: json['description'] as String?,
      budget: json['budget'] as int?,
      time: json['time'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'skills': skills,
        'description': description,
        'budget': budget,
        'time': time,
        'created_at': createdAt,
      };
}
