import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled9/model/food.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  const FoodTile({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 25),
      child: Column(
        children: [
          Image.asset(
            widget.food.imagePath, // Access the food image path from the widget
            height: 140,
          ),
          Text(
            widget.food.name,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.black, // Adjust the color as needed
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Text('/\$' + widget.food.price),
                Icon(Icons.star),
                Text(widget.food.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
