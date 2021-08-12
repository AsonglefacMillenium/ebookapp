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
  late ScrollController _scrollController;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
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
                              labelPadding: EdgeInsets.only(right:10),
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
                                Container(
                                  width: 120,
                                  height: 50,
                                  
                                  alignment: Alignment.center,
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(
                                        color: Colors.yellow,
                                        blurRadius: 2,
                                        offset: Offset(0, 0),

                                    ),
                                    ], 
                                  ),
                                ),
                                 Container(
                                  width: 120,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 2,
                                        offset: Offset(0, 0),

                                    ),
                                    ], 
                                  ),
                                ),
                                 Container(
                                  width: 120,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 2,
                                        offset: Offset(0, 0),

                                    ),
                                    ], 
                                  ),
                                ),
                              ],
                            ),
                            ) ,
                        ) ,
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey,),
                          title: Text('Welcome to this ebook'),
                        ),
                      ),
                       Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey,),
                          title: Text('Welcome to this ebook'),
                        ),
                      ),
                       Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey,),
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

