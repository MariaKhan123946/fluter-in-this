import 'package:flutter/material.dart';
import 'package:untitled7/exercise.dart';
import 'workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [];

  List<Workout> getWorkoutList() {
    return workoutList;
  }

  void addWorkout(String name, List<Exercise> exercises) {
    workoutList.add(Workout(name: name, exercises: exercises));
    notifyListeners();
  }
}
