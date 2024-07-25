import 'package:json_annotation/json_annotation.dart';

part 'api_exercise.g.dart';

@JsonSerializable()
class Exercise {
  final String? id;
  final String? name;
  final String? description;
  final String? gifUrl;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.gifUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
