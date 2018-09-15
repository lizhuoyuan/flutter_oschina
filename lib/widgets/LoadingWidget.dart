/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 预加载布局
 */

import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 1.0,
          ),
          Container(
            child: Text("正在加载"),
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
