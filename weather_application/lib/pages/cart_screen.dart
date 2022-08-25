import 'package:flutter/material.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: TitleText(
          title: 'My Cart',
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
      body: ConditionalBuilder(
        condition: true,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Cart empty.png'),
              const SizedBox(
                height: 20,
              ),
              TitleText(
                  title: 'Your Cart is empty', textStyle: ThemeText.mainTitle),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TitleText(
                    title:
                        'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                    textStyle: ThemeText.labelTitle),
              ),
            ],
          ),
        ),
        fallback: (context) => Padding(
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
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleText(
                                          title: 'Cactus plant',
                                          textStyle: ThemeText.blacklabelTitle),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TitleText(
                                          title: '200 EGP',
                                          textStyle: ThemeText.priceTitle),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: brightgrey,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: green,
                                                  ),
                                                ),
                                                TitleText(
                                                    title: '$counter',
                                                    textStyle: ThemeText
                                                        .blacklabelTitle),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 18,
                                              color: green,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TitleText(
                              title: 'Total',
                              textStyle: ThemeText.blacklabelTitle),
                          TitleText(
                              title: '180000 EGP',
                              textStyle: ThemeText.priceTitle),
                        ],
                      ),
                    ),
                    MainButton(buttonText: 'Checkout', onclick: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Cart empty.png'),
            const SizedBox(
              height: 20,
            ),
            TitleText(
                title: 'Your Cart is empty', textStyle: ThemeText.mainTitle),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TitleText(
                  title:
                      'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                  textStyle: ThemeText.labelTitle),
            ),
          ],
        ),
        
      ), */