// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  Todos(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.onDelete});
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black87,
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: taskCompleted ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace'),
            ),
            MaterialButton(
                onPressed: onDelete,
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
      ),
    );
    ;
  }
}
