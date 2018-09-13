/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import '../widgets/LoadingWidget.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailState();
}

class NewsDetailState extends State<NewsDetailPage> {
  int text = 1;

  @override
  Widget build(BuildContext context) {
    print('widget build');

    return Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
      appBar: AppBar(
        title: Text('资讯详情'),
      ),
    );
  }
}
