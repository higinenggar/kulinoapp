// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kulino_app/detail/widget/datepicker.dart';
import 'package:kulino_app/detail/widget/task_timeline.dart';
import 'package:kulino_app/detail/widget/task_title.dart';
import 'package:kulino_app/model/task_model.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage(this.task);
  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePicker(),
                    TaskTitle(),
                  ],
                ),
              ),
            ),
            detailList == null
                ? SliverFillRemaining(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'No Task Today',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => TaskTimeline(detailList[index]),
                      childCount: detailList.length,
                    ),
                  )
          ],
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Color(0xff503aa3),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 30,
          color: Colors.white,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You Have ${task.left} tasks for today',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Inter',
                color: Color(0xffb1a1e9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
