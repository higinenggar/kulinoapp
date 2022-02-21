// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kulino_app/widget/kulino_info.dart';
import 'package:kulino_app/widget/task.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String filterType = "today";
  DateTime datenow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    top: 3,
                  ),
                  height: 40,
                  width: 40,
                  //margin: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Hai, Darcy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                )
              ],
            ),
          ),
          KulinoInfo(),
          Container(
            padding: EdgeInsets.only(top: 5, left: 20, bottom: 10),
            child: Text(
              'To do',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Tasks(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Color(0xff432F70),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

Widget _buildBottomNavbar() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
          )
        ]),
    child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xffEAE4FF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF713770),
          unselectedItemColor: Color(0xffb1a1e9),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(
                Icons.person_rounded,
                size: 30,
              ),
            ),
          ],
        )),
  );
}

AppBar _buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 2,
    title: Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.cover,
      height: 20,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          Icons.notifications_outlined,
          color: Color(0xFF432F70),
          size: 25,
        ),
      )
    ],
  );
}
