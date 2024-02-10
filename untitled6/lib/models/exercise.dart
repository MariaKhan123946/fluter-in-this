class Exercise{
  final String name;
  final String weights;
  final String reps;
  final String sets;
  bool isCompleted;

  Exercise({
    required this.name,
    required this.weights,
    required this.reps,
    required this.sets,
    this.isCompleted=false,
  });
}