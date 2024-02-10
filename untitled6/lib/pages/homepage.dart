import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/components/heatmap.dart';
import 'package:untitled6/data/workout_data.dart';
import 'WorkoutPage.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final newWorkoutNameController = TextEditingController();

  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create new workout'),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void goToWorkoutPage(String workOutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkOutPage(
          workOutName: workOutName,
        ),
      ),
    );
  }

  void save() {
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkOutData>(context, listen: false).getStartDate();
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text('Workout Tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        ),
        body:ListView(
          children: [
            MYHeatMap(datasets:value.heatMapDataSet , startDateyyyyMMDD: value.getStartDate()),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.getWorkOutList().length,
              itemBuilder: (context, index) => ListTile(
                title: Text(value.getWorkOutList()[index].name),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => goToWorkoutPage(value.getWorkOutList()[index].name),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
