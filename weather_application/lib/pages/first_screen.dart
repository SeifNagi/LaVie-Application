import 'package:flutter/material.dart';
import 'package:weather_application/pages/login_screen.dart';
import 'package:weather_application/pages/main_screen.dart';
import 'package:weather_application/pages/sign_up_screen.dart';
import 'dart:math' as Math;
import 'package:weather_application/utils/colors/main_used_colors.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.rotate(
                      angle: Math.pi / 180 * 180,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/grass.png",
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/La Vie logo.png",
                ),
                Container(
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: green,
                    indicatorColor: green,
                    unselectedLabelColor: grey,
                    controller: tabController,
                    tabs: const [Tab(text: 'Sign up'), Tab(text: 'Login')],
                  ),
                ),
                SizedBox(
                  height: 340,
                  child: TabBarView(
                    controller: tabController,
                    children: [Container(child: SignUp()), LogIn()],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/grass.png",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
