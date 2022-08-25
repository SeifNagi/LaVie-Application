import 'package:flutter/material.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ]),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 15.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/Rectangle 15.png'),
                radius: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: lightgreen,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Image.asset('assets/images/stars_earned.png'),
                              SizedBox(
                                width: width / 20,
                              ),
                              TitleText(
                                title: 'You have 30 points ',
                                textStyle: ThemeText.blacklabelTitle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 20),
                      TitleText(
                          title: 'Edit Profile',
                          textStyle: ThemeText.mainTitle),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: grey,
                            width: 1,
                          ),
                        ),
                        child: MainButton(
                          buttonTextColor: black,
                          buttonText: 'change Name',
                          onclick: () {},
                          buttonBacgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(height: 20),
                      /*Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: grey,
                            width: 1,
                          ),
                        ),
                        child: MainButton(
                          buttonTextColor: black,
                          buttonText: 'change Email',
                          onclick: () {},
                          buttonBacgroundColor: Colors.transparent,
                        ),
                      ),*/

                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.swap_horiz),
                        label: const Text('Change Email'),
                        style: ButtonStyle(),
                      ),
                      Image.asset('assets/images/icon.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
