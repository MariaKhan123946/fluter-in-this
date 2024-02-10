import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled9/MyButton/button.dart'; // Import Google Fonts

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,138, 60, 55,),

      // Corrected color values
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("SUSHI MAN",style: TextStyle(fontSize: 20, fontWeight:FontWeight.w200,color: Colors.white),),
              SizedBox(height: 25),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(25), // Corrected indentation
                  child: Image.asset('assets/Images/PngItem_464176.png',height: 200,width: 200,), // Replace with the actual image path
                ),
              ),
              SizedBox(height: 25),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),// Corrected syntax
              Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 1.25, // Adjusted line height
                ),
              ),
              SizedBox(height: 25,),
              MyButton(text: "Get Started", onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },)
            ],
          ),
        ),
      ),
    );
  }
}
