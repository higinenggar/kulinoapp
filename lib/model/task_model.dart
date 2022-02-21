import 'package:flutter/material.dart';
import 'package:kulino_app/constants/color.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.btnColor,
      this.iconColor,
      this.left,
      this.done,
      this.desc,
      this.isLast = false});
  static List<Task> generateTasks() {
    return [
      Task(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: kYellowLight,
          iconColor: kYellow,
          btnColor: kYellowDark,
          left: 3,
          done: 1,
          desc: [
            {
              'time': '06.30 am',
              'title': 'Breakfast with Tomy',
              'slot': '06.30 - 07.00 am',
              'tlcolor': kRedDark,
              'bgcolor': kRedLight,
            },
            {
              'time': '07.00 am',
              'title': 'House Chores',
              'slot': '07.15 - 08.30 am',
              'tlcolor': kBlueDark,
              'bgcolor': kBlueLight,
            },
            {
              'time': '09.00 am',
              'title': '',
              'slot': '',
              'tlcolor': kBlueDark,
            },
            {
              'time': '11.00 am',
              'title': 'Meeting With Client',
              'slot': '11.00 - 01.00 pm',
              'tlcolor': kYellowDark,
              'bgcolor': kYellowLight,
            },
            {
              'time': '02.00 pm',
              'title': '',
              'slot': '',
              'tlcolor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '03.00 pm',
              'title': '',
              'slot': '',
              'tlcolor': Colors.grey.withOpacity(0.3),
            },
          ]),
      Task(
        iconData: Icons.cases_rounded,
        title: 'Meeting',
        bgColor: kRedLight,
        iconColor: kRed,
        btnColor: kRedDark,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.favorite,
        title: 'Health',
        bgColor: kBlueLight,
        iconColor: kBlue,
        btnColor: kBlueDark,
        left: 0,
        done: 0,
      ),
      Task(isLast: true),
    ];
  }
}
