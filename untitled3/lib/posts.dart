import 'package:flutter/material.dart';

import 'single posts.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SinglePosts(),
        SinglePosts(),
        SinglePosts(),
      ],
    );
  }
}
