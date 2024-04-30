// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/utlis/Todos.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todosData = [];

  TextEditingController controller = TextEditingController();

  onchange(bool? value, int index) {
    setState(() {
      todosData[index][1] = !todosData[index][1];
      controller.clear();
    });
  }

  onDelete(int index) {
    setState(() {
      todosData.removeAt(index);
      controller.clear();
    });
  }

  void aadItem() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.black38,
              content: Container(
                  height: 120,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Add Todo",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              color: Colors.white,
                              onPressed: onCLick,
                              child: Text("Add")),
                          MaterialButton(
                              color: Colors.white,
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel")),
                        ],
                      )
                    ],
                  )),
            ));
  }

  onCLick() {
    setState(() {
      Navigator.pop(context);
      todosData.add([controller.text, false]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.black54,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            title: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Todo App ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                      color: Colors.white),
                ),
                Icon(
                  Icons.note,
                  color: Colors.white,
                ),
              ],
            ))),
        floatingActionButton: FloatingActionButton(
          onPressed: aadItem,
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: todosData.length,
          itemBuilder: (context, index) => Todos(
            taskName: todosData[index][0],
            taskCompleted: todosData[index][1],
            onChanged: (value) => onchange(value, index),
            onDelete: () => onDelete(index),
          ),
        ));
  }
}
