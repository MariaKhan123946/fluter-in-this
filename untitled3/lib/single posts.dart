import 'package:flutter/material.dart';
import 'style.dart';

class SinglePosts extends StatelessWidget {
  const SinglePosts({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          margin: EdgeInsets.only(left: 30.0),
          height: 150,
          width: 300, // Adjust the width as needed
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
            child: Image.asset(
              'assets/Images/ba239ab8e5e279e68a34505feb6ffe6f.jpg',


            ),
          ),
        ),
        SizedBox(width: 8.0),
        Container(
          margin: EdgeInsets.only(left: 80.0, right: 5.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Subscribe To Flutter Today",
                style: postText,
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.comment_outlined,
                        size: 16.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text('15', style: postText),
                    ],
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 16.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text('15', style: postText),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
