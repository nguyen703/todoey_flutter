import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'background_sliding.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              key: Key(task.name),
              onDismissed: (DismissDirection direction) {
                taskData.deleteTask(task);
              },
              child: InkWell(
                onTap: () {
                  print('${task.name} clicked');
                },
                child: TaskTile(
                  isChecked: task.isDone,
                  taskTitle: task.name,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              ),
              confirmDismiss: (direction) async {
                // if (direction == DismissDirection.endToStart) {
                final bool? res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Are you sure you want to delete ${task.name}?"),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              // TODO: Delete the item from DB etc..
                              taskData.deleteTask(task);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return res;
                // } else {
                // TODO: edit the task
              }
              // },
              );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
