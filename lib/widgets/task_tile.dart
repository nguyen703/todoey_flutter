import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        // onLongPress: longPressCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.cyan,
          value: isChecked,
          onChanged: (value) => checkboxCallback(value),
        ));
  }
}
