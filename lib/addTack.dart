import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProviderViewModel.dart';
import 'TaskModel.dart';

class AddTask extends StatelessWidget {
  String? taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              onChanged: (val) {
                taskName = val;
              },
              decoration: InputDecoration(
                labelText: "Task Name",
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.red),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            child: Consumer<ProviderViewModel>(
              builder: (a, b, c) {
                return Checkbox(
                  value: b.value,
                  onChanged: (val) {
                    b.value = !b.value;
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Consumer<ProviderViewModel>(
              builder: (a, b, c) {
                return ElevatedButton(
                  onPressed: () {
                    b
                        .insertTask(TaskModel(this.taskName!, b.value))
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Add Task', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
