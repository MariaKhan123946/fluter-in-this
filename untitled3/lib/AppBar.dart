import 'package:flutter/material.dart';
import 'package:untitled3/style.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffeaeaea),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),


      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Text('profile', style: titleText,),
  Icon(Icons.search,size: 25.0,),

],
      ),
      
    );


  }
}
