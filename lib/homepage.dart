import 'dart:convert';

import 'package:ebookapp/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebookapp/app_colors.dart' as AppColors;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
 late List books;
   late List popularBooks;
  late ScrollController _scrollController;
  late TabController _tabController;
  readData() async {
    await DefaultAssetBundle.of(context).loadString("json/books.json").then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context).loadString("json/popularBooks.json").then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    
    readData();
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(Icons.notifications),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text('Popular Books'),
                  ),
                ],
              ),
              Container(
                height: 180.0,
                child: Stack(
                  children: [
                    Positioned(
                      left: -20,
                      child: Container(
                        alignment: Alignment.center,
                        height: 180.0,
                        width: 400.0,
                        child: PageView.builder(
                            itemCount: 5,
                            controller: PageController(viewportFraction: 0.8),
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180.0,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green.shade300),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: Colors.white,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 10),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              tabs: [
                                AppTabs(
                                  color: AppColors.menucolor1,
                                  text: 'New',
                                ),
                                AppTabs(
                                  color: AppColors.menuColor2,
                                  text: 'Popular',
                                ),
                                AppTabs(
                                  color: AppColors.menuColor3,
                                  text: 'Trending',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        // ignore: unnecessary_null_comparison
                        itemCount: books.length,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.tabBarViewColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(books[i]["imageLink"]),
                                        ),
                                      ),
                                     
                                    ),
                                    Text(books[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text('Welcome to this ebook'),
                        ),
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text('Welcome to this ebook'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
