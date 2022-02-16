// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kulino_app/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      home: SplashScreen(),
    );
  }
}
