import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FloatingButton(),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: Platform.isAndroid ? 60.0 : 40.0,
        ),
        // clipBehavior: Clip.antiAlias,
        color: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          border: Border.all(width: 0, color: Colors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderSpace(),
            TaskListSpace(),
          ],
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      // make the button bigger
      child: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xff757575),
              context: context,

              // AddTaskScreen must be above of the keyboard by adding this
              builder: (context) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ));
        },
      ),
    );
  }
}

class TaskListSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            // bottomLeft: Radius.circular(20.0),
            // bottomRight: Radius.circular(20.0),
          ),
        ),
        child: TasksList(),
      ),
    );
  }
}

class HeaderSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // wrapped by this Container to have a cyan background color
      // to have BorderRadius at top left and right
      color: Colors.cyan,
      padding:
          EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.list,
              size: 30.0,
              color: Colors.cyan,
            ),
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'To do-do-doo-doo',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 38.0,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${Provider.of<TaskData>(context).taskCount} tasks',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
