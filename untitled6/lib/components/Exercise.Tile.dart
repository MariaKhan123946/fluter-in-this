import 'package:flutter/material.dart';

class ExerciseTile extends StatefulWidget {
  final String exerciseName;
  final String weights;
  final String reps;
  final String sets;
  final bool isCompleted;
  final void Function(bool) onCheckBoxChanged;

  ExerciseTile({
    Key? key,
    required this.exerciseName,
    required this.weights,
    required this.sets,
    required this.reps,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  }) : super(key: key);

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(
          widget.exerciseName,
        ),
        subtitle: Row(
          children: [
            Chip(
              label: Text("${widget.weights}kg"),
            ),
            Chip(
              label: Text("${widget.reps}reps"),
            ),
            Chip(
              label: Text("${widget.sets}sets"),
            ),
          ],
        ),
        trailing: Checkbox(
          value: widget.isCompleted,
          onChanged: (value)=>widget.onCheckBoxChanged,
        ),
      ),
    );
  }
}
