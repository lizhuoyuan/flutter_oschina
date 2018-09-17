/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class TweetsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TweetListState();
}

class TweetListState extends State<TweetsListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TweetsListPage'),
    );
  }

  @override
  void dispose() {
    print('TweetsListPage dispose');
    super.dispose();
  }

  // TODO: implement wantKeepAlive 当页面不显示的时候也常驻在内存中
  @override
  bool get wantKeepAlive => true;
}
