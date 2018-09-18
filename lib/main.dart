import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oschina/page/DiscoverListPage.dart';
import 'package:flutter_oschina/page/DrawerPage.dart';
import 'package:flutter_oschina/page/MyInfoListPage.dart';
import 'package:flutter_oschina/page/NewsDetailPage.dart';
import 'package:flutter_oschina/page/NewsListPage.dart';
import 'package:flutter_oschina/page/TweetsListPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MyApp> with SingleTickerProviderStateMixin {
  //当前选中的index
  int _index = 0;

  // 页面顶部的大标题（也是TabItem上的文本和图标）
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];
  var icons = [
    Icons.fiber_new,
    Icons.network_cell,
    Icons.disc_full,
    Icons.person
  ];
  var colors = [Colors.blue, Colors.pink, Colors.green, Colors.red];

  //显示的page页面
  var pages = [
    NewsListPage(),
    TweetsListPage(),
    DiscoverListPage(),
    MyInfoListPage()
  ];

  //tabbarView 的控制器
  //TabController pageController;

  @override
  void initState() {
    //pageController = TabController(length: pages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',

      //页面主题色
      theme: ThemeData(
        primarySwatch: colors[_index],
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: colors[_index],
          title: Text(
            appBarTitles[_index],
          ),
        ),
        /*body: TabBarView(
          children: pages,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
        )*/
        body: IndexedStack(
          children: pages,
          index: _index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _getBottomNavItem(),
          currentIndex: _index,
          onTap: _onTap,
          fixedColor: Colors.green,
          type: BottomNavigationBarType.shifting,
        ),

        // drawer属性用于为当前页面添加一个侧滑菜单
        drawer: DrawerPage(),
      ),
      routes: <String, WidgetBuilder>{
        'NewsDetail': (_) => NewsDetailPage(),
      },
    );
  }

  List<BottomNavigationBarItem> _getBottomNavItem() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(BottomNavigationBarItem(
        icon: Icon(icons[i]),
        title: Text(appBarTitles[i]),
        backgroundColor: colors[i],
      ));
    }
    return list;
  }

  void _onTap(int value) {
    print(value);
    setState(() {
      _index = value;
    });
    //pageController.index = _index;
  }
}
