/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 预加载布局
 */

import 'package:flutter/material.dart';

class FailLoadWidget extends StatelessWidget {
  var _onPress;

  FailLoadWidget(onPress) {
    this._onPress = onPress;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.refresh),
          Text('重新请求'),
        ],
      ),
      onPressed: _onPress,
    ));
  }
}
