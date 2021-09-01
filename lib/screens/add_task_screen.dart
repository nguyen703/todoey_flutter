import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

String newTaskTitle = '';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add a new task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.cyan,
                ),
              ),
              TextField(
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Example: Meeting with Joe',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              TextButton(
                onPressed: () {
                  if (newTaskTitle != '') {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
