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

class MainState extends State<MyApp> {
  //当前选中的index
  int _index = 0;

  // 页面顶部的大标题（也是TabItem上的文本）
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];
  var icons = [
    Icons.fiber_new,
    Icons.network_cell,
    Icons.disc_full,
    Icons.person
  ];

  //显示的page页面
  var pages = [
    NewsListPage(),
    TweetsListPage(),
    DiscoverListPage(),
    MyInfoListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',

      //页面主题色
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitles[_index],
          ),
        ),
        body: pages[_index],
        bottomNavigationBar: CupertinoTabBar(
          items: _getBottomNavItem(),
          currentIndex: _index,
          onTap: _onTap,
          activeColor: Colors.green,
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
          icon: Icon(icons[i]), title: Text(appBarTitles[i])));
    }
    return list;
  }

  void _onTap(int value) {
    print(value);
    setState(() {
      _index = value;
    });
  }
}
