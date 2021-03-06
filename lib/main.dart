import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oschina/page/DiscoverListPage.dart';
import 'package:flutter_oschina/page/DrawerPage.dart';
import 'package:flutter_oschina/page/MyInfoListPage.dart';
import 'package:flutter_oschina/page/NewsDetailPage.dart';
import 'package:flutter_oschina/page/NewsListPage.dart';
import 'package:flutter_oschina/page/TweetsListPage.dart';
import 'package:flutter_oschina/model/AppModel.dart';
import 'package:scoped_model/scoped_model.dart';

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
  PageController pageController;

  AppModel appModel = AppModel();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        title: 'Flutter Demo',

        //页面主题色
        theme: ThemeData(
          //primaryColor: appModel.nightMode ? Colors.black : colors[_index],
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
          body: PageView(
            children: pages,
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
          )
              /*body: IndexedStack(
          children: pages,
          index: _index,
        )*/
              ,
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
      ),
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
    if (value != _index) {
      print(value);

      pageController.animateToPage(value,
          duration: Duration(milliseconds: 300), curve: Curves.ease);

      //pageController.jumpToPage(value);

      setState(() {
        _index = value;
      });
    }
  }
}
