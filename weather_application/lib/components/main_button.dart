import 'package:flutter/material.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  final String buttonText;
  Color buttonTextColor;
  Color buttonBacgroundColor;
  final VoidCallback onclick;
  double borderSize;
  double height;

  double fontsize;
  MainButton(
      {Key? key,
      required this.buttonText,
      this.buttonBacgroundColor = green,
      this.buttonTextColor = white,
      required this.onclick,
      this.borderSize = 5,
      this.height = 47,
      this.fontsize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderSize),
          color: buttonBacgroundColor),
      child: TextButton(
        child: Text(
          buttonText,
          style: TextStyle(color: buttonTextColor, fontSize: fontsize),
        ),
        onPressed: () {
          onclick();
        },
      ),
    );
  }
}
