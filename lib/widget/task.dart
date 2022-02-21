// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kulino_app/detail/detail.dart';
import 'package:kulino_app/model/task_model.dart';

class Tasks extends StatelessWidget {
  final taskList = Task.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: taskList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) => taskList[index].isLast
              ? _buildAddTaks()
              : _buildTask(context, taskList[index])),
    );
  }

  Widget _buildAddTaks() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      dashPattern: [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: Center(
        child: Text(
          ' + Add',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailPage(task)));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: task.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.iconData,
              color: task.btnColor,
              size: 35,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              task.title!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _buildTaskStatus(
                    task.btnColor!, task.iconColor!, '${task.left} left'),
                SizedBox(
                  width: 5,
                ),
                _buildTaskStatus(
                    Colors.white, task.btnColor!, '${task.done} done'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color txColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txColor,
          fontFamily: 'Inter',
          fontSize: 10,
        ),
      ),
    );
  }
}
