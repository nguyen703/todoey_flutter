class Task {
  String name;
  bool isDone = false;

  Task({required this.name, isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
