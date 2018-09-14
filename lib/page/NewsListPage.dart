/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 资讯页
 */

import 'package:flutter/material.dart';
import 'package:flutter_oschina/widgets/SliderView.dart';
import 'dart:ui';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsListState();
}

class NewsListState extends State {
  //轮播图
  List imgs = [];

  //下面的列表
  var listData = [];

  @override
  void initState() {
    // 这里做数据初始化，加入一些测试数据
    for (int i = 0; i < 3; i++) {
      Map map = new Map();
      // 轮播图的资讯标题
      map['title'] = 'Python 之父透露退位隐情';
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
      map['title'] = 'J2Cache 2.3.23 发布，支持 memcached 二级缓存';
      // 列表item的作者头像URL
      map['authorImg'] =
          'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      // 列表item的时间文本
      map['timeStr'] = '2018/7/30';
      // 列表item的资讯图片
      map['thumb'] =
          'https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh%3D600%2C800/sign=b53745a5ccfc1e17fdea84377aa0da3b/6609c93d70cf3bc769a33f5fd200baa1cc112ae6.jpg';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: listData.length * 2 + 1,
      itemBuilder: _renderRow,
    ));
  }

  /*  
   * 加载资讯页的列表
   */
  Widget _renderRow(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        height: 250.0,
        child: SliderView(imgs),
      );
    }
    index -= 1;
    // i为奇数，渲染分割线
    if (index.isOdd) {
      return new Divider(height: 1.0);
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
                    Text(
                      listData[index]['timeStr'],
                    ),
                    Text(
                      listData[index]['commCount'].toString(),
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
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
