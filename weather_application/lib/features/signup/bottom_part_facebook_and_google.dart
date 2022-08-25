import 'package:flutter/material.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/google logo.png'),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/images/facebook logo.png'),
            iconSize: 50,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
