import 'package:flutter/material.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: TitleText(
          title: 'Blog',
          textStyle: ThemeText.mainTitle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: grey,
                                offset: Offset(0, 12),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                              BoxShadow(
                                color: white,
                                spreadRadius: 5.0,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Rectangle 15.png',
                                height: 130,
                                width: 130,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleText(
                                          title: '2 days ago',
                                          textStyle: ThemeText.blogDayTitle),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TitleText(
                                          title: '5 Tips to treat plants',
                                          textStyle: ThemeText.blacklabelTitle),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TitleText(
                                          title:
                                              'leaf, in botany, any usually leaf, in botany, any usually',
                                          textStyle:
                                              ThemeText.blogDetailsTitle),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
