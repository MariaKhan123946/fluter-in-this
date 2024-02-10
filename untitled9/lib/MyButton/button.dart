import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(100, 140, 94, 91),
          borderRadius: BorderRadius.circular(48),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: Colors.white), // Moved color to the Icon
          ],
        ),
      ),
    );
  }
}
