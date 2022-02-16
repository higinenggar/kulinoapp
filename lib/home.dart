// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String filterType = "today";
  DateTime datenow = DateTime.now();

  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.indigo,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                title: Text(
                  'Personal Tasks',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                //centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.short_text,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                height: 70,
                color: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("today");
                          },
                          child: Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "today")
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("monthly");
                          },
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "monthly")
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (filterType == "monthly")
                  ? TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarFormat: CalendarFormat.week,
                    )
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today ${monthNames[datenow.month - 1]}, ${datenow.day}/${datenow.year}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      taskWidget(
                          Colors.redAccent, "Meeting with client", "9.00 AM"),
                      taskWidget(
                          Colors.teal, "Buy some foods for tom", "13.00 PM"),
                      taskWidget(
                          Colors.blueAccent, "Completing course", "19.00 PM"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String tittle, String time) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [],
      ),
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 4,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tittle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    //fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 4,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}

// AppBar _buildAppBar() {
//   return AppBar(
//     automaticallyImplyLeading: false,
//     backgroundColor: Colors.white,
//     elevation: 0,
//     title: Row(
//       children: [
//         Container(
//           margin: EdgeInsets.only(
//             left: 5,
//             top: 5,
//           ),
//           height: 45,
//           width: 45,
//           //margin: EdgeInsets.only(left: 5),
//           child: CircleAvatar(
//             backgroundImage: AssetImage('assets/images/avatar.jpg'),
//           ),
//         ),
//         SizedBox(
//           width: 15,
//         ),
//         Text(
//           'Hi, Amanda',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//       ],
//     ),
//     // ignore: prefer_const_literals_to_create_immutables
//     actions: [
//       Icon(
//         Icons.more_vert,
//         color: Colors.black,
//         size: 30,
//       )
//     ],
//   );
// }
