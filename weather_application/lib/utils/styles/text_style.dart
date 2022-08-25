// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';

abstract class ThemeText {
  static TextStyle mainTitle = const TextStyle(color: black, fontSize: 20);

  static const TextStyle textfieldLabel = TextStyle(
    color: black,
    fontSize: 14,
  );

  static const TextStyle subTitle = TextStyle(
    color: grey,
    fontSize: 12,
  );

  static TextStyle labelTitle = const TextStyle(color: grey, fontSize: 16);

  static TextStyle priceTitle = const TextStyle(color: green, fontSize: 18);

  static TextStyle blogDayTitle = const TextStyle(color: green, fontSize: 13);

  static TextStyle TabBar = const TextStyle(color: green, fontSize: 12);

  static TextStyle blacklabelTitle =
      const TextStyle(color: black, fontSize: 18);
  static TextStyle blogDetailsTitle = const TextStyle(
    color: grey,
    fontSize: 13,
  );
}
