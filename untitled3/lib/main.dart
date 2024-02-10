import 'package:flutter/material.dart';

import 'AppBar.dart';
 // Instead of 'AppBar.dart'
import 'posts.dart';
// Instead of 'SinglePosts.dart'
import 'style.dart';
 // Instead of 'style.dart'
import 'profile.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(

          body: ListView(
            children: [
              Stack(
                children: [
                  MyPosts(),//MyPosts
                  Proffile(),//proffile
                  MyAppBar(),//AppBar

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



