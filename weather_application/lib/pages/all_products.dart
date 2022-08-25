import 'package:flutter/material.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class AllProducstScreen extends StatefulWidget {
  const AllProducstScreen({Key? key}) : super(key: key);

  @override
  State<AllProducstScreen> createState() => _AllProducstScreenState();
}

class _AllProducstScreenState extends State<AllProducstScreen> {
  void decrement() {
    if (counter == 0) {
      counter = 0;
    } else {
      counter--;
    }
  }

  @override
  int counter = 1;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: Container(
          color: white,
          child: GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            //primary: false,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1.3,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: brightgrey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 4),
                      )
                    ],
                    color: white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/images/product.png',
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    /*if (counter == 0) {
                                      setState(() {
                                        counter = 0;
                                      });
                                    } else {
                                      setState(() {
                                        counter--;
                                      });
                                    }*/
                                    setState(() {
                                      decrement();
                                    });
                                    debugPrint('$counter');
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 12,
                                    color: green,
                                  ),
                                ),
                                TitleText(
                                    title: '$counter',
                                    textStyle: ThemeText.subTitle),
                                IconButton(
                                  onPressed: () {
                                    debugPrint('$counter');

                                    setState(() {
                                      counter++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 12,
                                    color: green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(
                                    title: 'GARDENIA PLANT',
                                    textStyle: ThemeText.textfieldLabel),
                                const SizedBox(
                                  height: 5,
                                ),
                                TitleText(
                                    title: '70 EGP',
                                    textStyle: ThemeText.textfieldLabel),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: MainButton(
                                  buttonText: 'Add To Cart',
                                  fontsize: 16,
                                  height: 31,
                                  borderSize: 10,
                                  onclick: () {}),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
