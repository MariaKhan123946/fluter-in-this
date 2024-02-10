import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/components/Exercise.Tile.dart';
import 'package:untitled6/data/workout_data.dart';

import '../models/exercise.dart';
import '../models/workout.dart';

class WorkOutPage extends StatefulWidget {
  final String workOutName;

  const WorkOutPage({Key? key, required this.workOutName}) : super(key: key);

  @override
  State<WorkOutPage> createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage> {
  void onCheckBoxChanged(String workOutName, String exerciseName) {
    Provider.of<WorkOutData>(context, listen: false)
        .checkOffExercise(workOutName, exerciseName);

  }
  final exerciseNameController=TextEditingController();
  final weightController=TextEditingController();
  final repsController=TextEditingController();
  final setsController=TextEditingController();

  void createNewExercise(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Add a new Exercise'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
TextField(
  controller:exerciseNameController ,
),
          TextField(
            controller:weightController ,
          ),
          TextField(
            controller:repsController ,
          ),
          TextField(
            controller:setsController ,
          ),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: save,
          child: Text("Save"),
        ),
        MaterialButton(
          onPressed: cancel,
          child: Text("Cancel"),
        ),
      ],
    ),
    );
  }
  void save() {
    String newExerciseName = exerciseNameController.text;
    String weight=weightController.text;
    String reps=repsController.text;
    String sets=setsController.text;
    Provider.of<WorkOutData>(context, listen: false).addExercise(
        widget.workOutName, newExerciseName,weight , reps, sets);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workOutName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewExercise,
        ),
        body: ListView.builder(
          itemCount: value.numberOfExercisesInWorkOut(widget.workOutName),
          itemBuilder: (context, index) {
            // Get the relevant workout
            WorkOut relevantWorkout = value.getRelevantWorkOut(widget.workOutName);

            // Get the specific exercise for the current index
            Exercise currentExercise = relevantWorkout.exercise[index];

            return ExerciseTile(
              exerciseName: currentExercise.name,
              weights: currentExercise.weights,
              reps: currentExercise.reps,
              sets: currentExercise.sets,
              isCompleted: currentExercise.isCompleted,
              onCheckBoxChanged: (value) => onCheckBoxChanged(
                widget.workOutName,
                currentExercise.name,
              ),
            );
          },
        ),
      ),
    );
  }
}
