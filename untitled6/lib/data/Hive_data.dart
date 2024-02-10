import 'package:hive/hive.dart';
import 'package:untitled6/models/workout.dart';
import 'package:untitled6/models/exercise.dart'; // Import the correct Exercise model
import 'package:workout/workout.dart';


import 'data_time/Data_Time.dart';

class HiveDatabase {
  final _myBox = Hive.box("Workout_Database 1");

  bool previousDataExists() {
    if (_myBox.isEmpty) {
      print("previous data does not exist");
      _myBox.put("START_DATE", todaysDateYYYYMMDD());
      return false;
    } else {
      print("previous data does exist");
      return true;
    }
  }

  void saveToDatabase(List<Workout> workouts) {
    final workoutList = convertObjectToWorkoutList(workouts);
    final exerciseList = convertExerciseListToStringList(workouts.cast<Exercise>());

    if (exerciseCompleted(workouts)) {
      _myBox.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 1);
    } else {
      _myBox.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 0);
    }
    _myBox.put("WORKOUTS", workoutList);
    _myBox.put("EXERCISES", exerciseList);
  }

  List<Workout> readFromDatabase() {
    List<Workout> mySavedWorkouts = [];
    List<String> workoutStrings = _myBox.get("WORKOUTS") ?? [];
    final exerciseDetails = _myBox.get("EXERCISES") ?? [];

    for (int i = 0; i < workoutStrings.length; i++) {
      List<Exercise> exercisesInEachWorkout = [];
      for (int j = 0; j < exerciseDetails[i].length; j++) {
        exercisesInEachWorkout.add(Exercise(
          name: exerciseDetails[i][j][0],
          weights: exerciseDetails[i][j][1],
          reps: exerciseDetails[i][j][2],
          sets: exerciseDetails[i][j][3],
          isCompleted: exerciseDetails[i][j][4] == "true" ? true : false,
        ));
      }

      Workout workout = Workout();
      mySavedWorkouts.add(workout);
    }

    return mySavedWorkouts;
  }

  bool exerciseCompleted(List<Workout> workouts) {
    for (var workout in workouts) {
      for (var exercise in workout.exercise) { // Change 'exercises' to 'exercise'
        if (exercise.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }

  int getCompletionStatus(String yyyymmdd) {
    int completionStatus = _myBox.get("COMPLETION_STATUS $yyyymmdd") ?? 0; // Corrected the key
    return completionStatus;
  }

  List<String> convertObjectToWorkoutList(List<Workout> workouts) {
    List<String> workoutList = [];

    for (int i = 0; i < workouts.length; i++) {
      String workoutString = workouts[i].name;

      // Convert exercises to a list of strings and append to workoutString

      List<String> exerciseList = convertExerciseListToStringList(workouts[i].exercise).cast<String>(); // Change 'exercises' to 'exercise'
      workoutString += ': ' + exerciseList.join(', ');

      workoutList.add(workoutString);
    }

    return workoutList;
  }

  List<List<List<String>>> convertExerciseListToStringList(List<Exercise> exercises) {
    List<List<List<String>>> exerciseList = [];

    for (int i = 0; i < exercises.length; i++) {
      List<String> exerciseStringList = [
        exercises[i].name,
        exercises[i].weights,
        exercises[i].reps,
        exercises[i].sets,
        exercises[i].isCompleted.toString(),
      ];
      exerciseList.add(exerciseStringList.cast<List<String>>());
    }

    return exerciseList;
  }
}
