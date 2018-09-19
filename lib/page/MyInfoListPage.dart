/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoListPage extends StatefulWidget {
  @override
  MyInfoListPageState createState() {
    return new MyInfoListPageState();
  }
}

class MyInfoListPageState extends State<MyInfoListPage>
    with AutomaticKeepAliveClientMixin {
  TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextField(
            //controller: accountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '请输入账号',
              labelText: '左上角',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (text) {
              //print(text);
            },
          ),
          RaisedButton(
            child: Text('存储'),
            onPressed: _onClick,
          ),
          RaisedButton(
            child: Text('读取'),
            onPressed: _readShared,
          ),
          RaisedButton(
            child: Text('删除'),
            onPressed: _removeShared,
          )
        ],
      ),
    );
  }

  Future _onClick() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = accountController.text;
    preferences.setString('account', account);
    print('存储acount为:$account');
  }

  Future _readShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = preferences.get('account');
    print('读取到acount为:$account');
    accountController.text = account;
  }

  Future _removeShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('account');
    print('删除acount成功');
  }

  @override
  void dispose() {
    super.dispose();
    print('myinfo dispose');
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
