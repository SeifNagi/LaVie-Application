// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  String title = 'Sunny';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(title: title, textStyle: ThemeText.mainTitle),
                        TitleText(title: '33c', textStyle: ThemeText.mainTitle),
                      ],
                    ),
                    Column(
                      children: [
                        if (title == 'Sunny')
                          Image.asset(
                            "assets/gifs/sunny.gif",
                            height: 100.0,
                            width: 100.0,
                          ),
                        if (title == 'Night')
                          Image.asset(
                            "assets/gifs/moon.gif",
                            height: 100.0,
                            width: 100.0,
                          ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      TitleText(
                          title: '3 pm\n34', textStyle: ThemeText.mainTitle),
                      const SizedBox(
                        width: 20,
                      ),
                      TitleText(
                          title: '4 pm\n34', textStyle: ThemeText.mainTitle),
                      Image.asset(
                        "assets/gifs/moon.gif",
                        height: 25.0,
                        width: 25.0,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TitleText(
                          title: '5 pm\n34', textStyle: ThemeText.mainTitle),
                      const SizedBox(
                        width: 20,
                      ),
                      TitleText(
                          title: '6 pm\n34', textStyle: ThemeText.mainTitle)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                              title: 'Yesterday',
                              textStyle: ThemeText.mainTitle),
                          TitleText(
                              title: '34c', textStyle: ThemeText.mainTitle),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
