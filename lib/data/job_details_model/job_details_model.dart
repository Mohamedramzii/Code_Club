import 'result.dart';

class JobDetailsModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  JobDetailsModel({this.count, this.next, this.previous, this.results});

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) {
    return JobDetailsModel(
      count: json['count'] as int?,
      next: json['next'] as dynamic,
      previous: json['previous'] as dynamic,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
