/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 资讯页
 */

import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'NewsDetail');
        },
        child: Text('goto detail'),
      ),
    );
  }
}
