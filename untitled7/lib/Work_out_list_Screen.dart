import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'WorkOut Data.dart';
import 'add_work_out_screen.dart';



class WorkoutListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout List'),
      ),
      body: Consumer<WorkoutData>(
        builder: (context, workoutData, child) {
          return ListView.builder(
            itemCount: workoutData.getWorkoutList().length,
            itemBuilder: (context, index) {
              var workout = workoutData.getWorkoutList()[index];
              return ListTile(
                title: Text(workout.name),
                onTap: () {
                  // Navigate to the details screen or do something with the selected workout
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddWorkoutScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
