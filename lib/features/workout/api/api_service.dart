import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_exercise.dart';

class ApiService {
  final String part;

  ApiService({
    required this.part,
  });

  String get baseUrl =>
      'https://exercisedb.p.rapidapi.com/exercises/bodyPart/$part?limit=20&offset=0';

  Future<List<Exercise>> fetchExercise() async {
    final response = await http.get(Uri.parse(baseUrl), headers: {
      'X-RapidAPI-Key': '13732c0a24msh0666500c322e5e7p15aebcjsnad58355b049c',
      'X-Rapidapi-Host': 'exercisedb.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Exercise.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
