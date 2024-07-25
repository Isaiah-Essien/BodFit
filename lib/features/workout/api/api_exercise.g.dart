// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      gifUrl: json['gifUrl'] as String?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'gifUrl': instance.gifUrl,
    };
