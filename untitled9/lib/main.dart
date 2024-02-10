import 'package:flutter/material.dart';

import 'IntroPage.dart';
import 'menupage.dart';

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
      home: IntroPage(),
      routes:{
        '/intropage':(context)=> IntroPage(),
        '/menupage':(context)=> MenuPage(),
      },


    );
  }
}

