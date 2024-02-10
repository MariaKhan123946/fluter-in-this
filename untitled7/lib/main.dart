import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WorkOut Data.dart';
import 'Work_out_list_Screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        title: 'Workout Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WorkoutListScreen(),
      ),
    );
  }
}
