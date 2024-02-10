import 'package:flutter/material.dart';
import 'package:untitled6/data/Hive_data.dart';
import 'package:untitled6/models/exercise.dart';
import 'package:untitled6/models/workout.dart';
import 'package:workout/src/workout_base.dart';

import 'data_time/Data_Time.dart';

class WorkOutData extends ChangeNotifier {
  final db = HiveDatabase();
  List<WorkOut> workoutList = [
    WorkOut(
      name: "Upper Body",
      exercise: [
        Exercise(
          name: "Biceps Curls",
          weights: "10",
          reps: "10",
          sets: "3",
        ),
      ],
    ),
    WorkOut(
      name: "Lower Body",
      exercise: [
        Exercise(
          name: "Biceps Curls",
          weights: "10",
          reps: "10",
          sets: "3",
        ),
      ],
    ),
  ];

  void initializeWorkoutList() {
    if (db.previousDataExists()) {
      workoutList = db.readFromDatabase().cast<WorkOut>();
    } else {
      db.saveToDatabase(workoutList.cast<Workout>());
    }
    loadHeatMap();
  }

  List<WorkOut> getWorkOutList() {
    return workoutList;
  }

  int numberOfExercisesInWorkOut(String workOutName) {
    WorkOut relevantWorkout = getRelevantWorkOut(workOutName);
    return relevantWorkout.exercise.length;
  }

  void addWorkOut(String name) {
    workoutList.add(WorkOut(name: name, exercise: []));
    notifyListeners();
    db.saveToDatabase(workoutList.cast<Workout>());
  }

  void addExercise(
      String workOutName,
      String exerciseName,
      String weights,
      String reps,
      String sets,
      ) {
    WorkOut relevantWorkout = getRelevantWorkOut(workOutName);

    relevantWorkout.exercise.add(Exercise(
      name: exerciseName,
      weights: weights,
      reps: reps,
      sets: sets,
    ));
    notifyListeners();
  }

  void checkOffExercise(String workoutName, String exerciseName) {
    WorkOut relevantWorkout = getRelevantWorkOut(workoutName);

    Exercise relevantExercise = relevantWorkout.exercise
        .firstWhere((element) => element.name == exerciseName);

    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    print("tapped");
    notifyListeners();
    db.saveToDatabase(workoutList.cast<Workout>());
    loadHeatMap();
  }

  WorkOut getRelevantWorkOut(String workoutName) {
    return workoutList.firstWhere((element) => element.name == workoutName);
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    WorkOut relevantWorkOut = getRelevantWorkOut(workoutName);
    Exercise relevantExercise = relevantWorkOut.exercise
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }

  String getStartDate() {
    return db.getStartDate();
  }

  Map<DateTime, int> heatMapDataSet = {};
  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(getStartDate());
    int daysInBetween = DateTime.now().difference(startDate).inDays;
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToYYYYMMDD(startDate.add(Duration(days: i)));
      int completionStatus = db.getCompletionStatus(yyyymmdd);
      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;
      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): completionStatus
      };
      heatMapDataSet.addAll(percentForEachDay);
    }
  }
}
