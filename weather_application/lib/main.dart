import 'package:flutter/material.dart';
import 'package:weather_application/local/cachehelepr.dart';
import 'package:weather_application/local/sharedpref_helper.dart';
import 'pages/first_screen.dart';

void main() async {
  Diohelper.init();
  sharedhelper.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Vie',
      home: firstScreen(),
    );
  }
}
//Se2if28@fa