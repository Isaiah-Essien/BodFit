import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';
import 'api_exercise.dart';
import 'api_service.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise test',
      home: ExerciseList(),
    );
  }
}

class ExerciseList extends StatefulWidget {
  const ExerciseList({super.key});

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  late Future<List<Exercise>> futureExercises;
  ApiService apiService = ApiService(part: MTexts.cardio);

  @override
  void initState() {
    super.initState();
    futureExercises = apiService.fetchExercise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: futureExercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No exercises found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Exercise exercise = snapshot.data![index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(exercise.name ?? 'No name'),
                        subtitle:
                            Text(exercise.description ?? 'No description'),
                      ),
                      if (exercise.gifUrl != null)
                        Image.network(exercise.gifUrl!)
                      else
                        Text('No GIF available'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
