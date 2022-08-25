import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/pages/blogs_screen.dart';
import 'package:weather_application/components/main_textfield.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/pages/all_products.dart';
import 'package:weather_application/pages/cart_screen.dart';
import 'package:weather_application/pages/profile_screen.dart';

import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int currentPage = 0;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4);
  }

  void _onItemPressed(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int bottomNavigationBarindex = 2;
    int counter = 1;
    final items = <Widget>[
      Image.asset('assets/images/leave.png'),
      Image.asset('assets/images/qr-code-scan.png'),
      const Icon(
        Icons.home_outlined,
        size: 25,
      ),
      const Icon(
        Icons.notifications_none_outlined,
        size: 25,
      ),
      const Icon(
        Icons.person_outline_sharp,
        size: 25,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Center(
          child: Image.asset('assets/images/La Vie logo.png'),
        ),
      ),
      body: Container(
        color: white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainTextField(
                prefixIcon: Icons.search,
                width: width - 100,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'No Search entered';
                  }
                },
                controller: searchController,
                keyboardtype: TextInputType.text,
                title: '',
                hint: 'Search',
                /*widget: TextButton(
                  onPressed: () {},
                  child: TitleText(
                    title: 'search',
                    textStyle: ThemeText.blacklabelTitle,
                  ),
                ),*/
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: green,
                ),
                height: 30,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: white,
                    )),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: TabBar(
              onTap: (value) => _onItemPressed(value),
              unselectedLabelColor: grey,
              indicatorSize: TabBarIndicatorSize.label,
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: green,
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      border: currentPage == 0
                          ? Border.all(width: 2, color: green)
                          : Border.all(width: 0, color: Colors.transparent),
                      color: currentPage == 0 ? white : brightgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TitleText(
                        textStyle: currentPage == 0
                            ? ThemeText.TabBar
                            : ThemeText.subTitle,
                        title: '      All      ',
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      border: currentPage == 1
                          ? Border.all(width: 2, color: green)
                          : Border.all(width: 0, color: Colors.transparent),
                      color: currentPage == 1 ? white : brightgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: TitleText(
                      textStyle: currentPage == 1
                          ? ThemeText.TabBar
                          : ThemeText.subTitle,
                      title: 'Plants',
                    )),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      border: currentPage == 2
                          ? Border.all(width: 2, color: green)
                          : Border.all(width: 0, color: Colors.transparent),
                      color: currentPage == 2 ? white : brightgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: TitleText(
                      textStyle: currentPage == 2
                          ? ThemeText.TabBar
                          : ThemeText.subTitle,
                      title: '   Seeds    ',
                    )),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      border: currentPage == 3
                          ? Border.all(width: 2, color: green)
                          : Border.all(width: 0, color: Colors.transparent),
                      color: currentPage == 3 ? white : brightgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: TitleText(
                      textStyle: currentPage == 3
                          ? ThemeText.TabBar
                          : ThemeText.subTitle,
                      title: 'Tools',
                    )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AllProducstScreen(),
                Center(
                  child: Text('Plants Pages ${currentPage}'),
                ),
                Center(
                  child: Text('Seeds Page ${currentPage}'),
                ),
                Center(
                  child: Text('Tools Page ${currentPage}'),
                )
              ],
            ),
          ),
          /*Expanded(
            child: Container(
              color: white,
              child: GridView.builder(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                //primary: false,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10, mainAxisSpacing: 20,
                  maxCrossAxisExtent: 200,
                  //childAspectRatio: 0 / 2,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      /*width: 100,
                      height: 100,*/
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
                                      onPressed: () {},
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
                                      onPressed: () {},
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
          ),*/
        ]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: brightgrey,
        buttonBackgroundColor: green,
        height: 60,
        index: bottomNavigationBarindex,
        items: items,
        onTap: (index) {
          setState(() {
            index = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlogScreen()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlogScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
/*
                Column(
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
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Stack(
                              children: [
                                Image.asset('assets/images/planet2.png'),
                                Image.asset('assets/images/planet1.png'),
                              ],
                            ),
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
                                    height: 35,
                                    borderSize: 10,
                                    onclick: () {}),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),*/
