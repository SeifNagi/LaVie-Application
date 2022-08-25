import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String title;
  TextStyle textStyle;
  TitleText({Key? key, required this.title, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
    );
  }
}
