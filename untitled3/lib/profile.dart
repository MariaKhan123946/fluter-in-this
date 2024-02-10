import 'package:flutter/material.dart';
import 'package:untitled3/style.dart';

class Proffile extends StatelessWidget {
  const Proffile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 170,),
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
      ),
      child: Column(
        children: [
          
          CircleAvatar(),
          SizedBox(height: 10,),
          Text('Hemunt Sharma',style:  heading4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.location_on,size: 16.0,color: Colors.grey,),
             Text('punjab', style: TextStyle(
               color: Colors.grey,
             ),)
           ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('121',style:counText
                    ),
                  Text('Posts',style: followText,),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                children: [
                  Text('20M',style:counText
                  ),
                  Text('follower',style: followText,),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                children: [
                  Text('127',style:counText
                  ),
                  Text('following',style: followText,),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
