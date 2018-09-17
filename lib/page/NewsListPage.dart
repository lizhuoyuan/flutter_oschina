/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 资讯页
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_oschina/widgets/FailLoadWidget.dart';
import 'package:flutter_oschina/widgets/LoadingWidget.dart';
import 'package:flutter_oschina/widgets/SliderView.dart';
import 'package:flutter_oschina/utils/HttpUtil.dart';
import 'package:flutter_oschina/utils/Api.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsListState();
}

class NewsListState extends State<NewsListPage> {
  //轮播图
  List imgs = [];

  //下面的列表
  var listData = [];

  bool isLoading = false;

  @override
  void initState() {
    getData();
    //initTestData();
    super.initState();
  }

  Future getData() async {
    String url = Api.NEWS_LIST;
    var data = {'pageIndex': 1, 'pageSize': 10};
    var response = await HttpUtil().get(url, data: data);

    setState(() {
      listData = response['msg']['news']['data'];
      imgs = response['msg']['slide'];
    });
  }

  void initTestData() {
    // 这里做数据初始化，加入一些测试数据
    for (int i = 0; i < 3; i++) {
      Map map = new Map();
      // 轮播图的资讯标题
      map['title'] = 'Google 之flutter 强势上位隐情';
      // 轮播图的详情URL
      map['detailUrl'] =
          'https://www.oschina.net/news/98455/guido-van-rossum-resigns';
      // 轮播图的图片URL
      map['imgUrl'] =
          'http://pic1.win4000.com/wallpaper/2017-10-25/59f083092ed4f.jpg';
      imgs.add(map);
    }
    for (int i = 0; i < 10; i++) {
      Map map = new Map();
      // 列表item的标题
      map['title'] = '我看完掘金上的227篇文章，总结出一份 Flutter 入门教程';
      // 列表item的作者头像URL
      map['authorImg'] =
          'https://leancloud-gold-cdn.xitu.io/a002a12e5ff6aa771d02.jpg';
      // 列表item的时间文本
      map['timeStr'] = '2018/7/30';
      // 列表item的资讯图片
      map['thumb'] =
          'https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh%3D600%2C800/sign=b53745a5ccfc1e17fdea84377aa0da3b/6609c93d70cf3bc769a33f5fd200baa1cc112ae6.jpg';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return FailLoadWidget(getData);
    } else if (listData.length == 0) {
      return LoadingWidget();
    }

    return Scaffold(
        body: RefreshIndicator(
            child: ListView.builder(
              itemCount: listData.length * 2 + 1,
              itemBuilder: _renderRow,
            ),
            onRefresh: getData));
  }

  /*  
   * 加载资讯页的列表
   */
  Widget _renderRow(BuildContext context, int index) {
    if (index == 0 && imgs.length > 0) {
      return Container(
        height: 250.0,
        child: SliderView(imgs),
      );
    }
    index -= 1;
    // i为奇数，渲染分割线
    if (index.isOdd) {
      return Divider(height: 1.0);
    }

    index = index ~/ 2;
    //var itemData = listData[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 280.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  listData[index]['title'],
                  maxLines: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(listData[index]['authorImg']),
                          radius: 10.0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              listData[index]['timeStr'],
                            ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 5.0),
                            child: Text(
                              listData[index]['commCount'].toString(),
                            )),
                        Icon(
                          Icons.forum,
                          color: Colors.grey,
                          size: 20.0,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Image.network(
            listData[index]['thumb'],
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('News dispose');
    super.dispose();
  }
}
