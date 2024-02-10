import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/WorkOut%20Data.dart';


class AddWorkoutScreen extends StatefulWidget {
  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: workoutNameController,
              decoration: InputDecoration(
                labelText: 'Workout Name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (workoutNameController.text.isNotEmpty) {
                  // Add the workout to the list
                  Provider.of<WorkoutData>(context, listen: false).addWorkout(
                    workoutNameController.text,
                    [],  // You can pass exercises here if needed
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Save Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
