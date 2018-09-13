/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 侧滑页面
 */

import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  List list = [
    {'img': 'http://pic1.win4000.com/wallpaper/2017-10-25/59f083092ed4f.jpg'},
    {'title': '标题1', 'leftImg': Icons.tag_faces},
    {'title': '标题2', 'leftImg': Icons.beach_access},
    {'title': '标题3', 'leftImg': Icons.airline_seat_recline_normal},
    {'title': '标题4', 'leftImg': Icons.wb_sunny},
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        //constraints参数指定了侧滑菜单的宽度
        constraints: const BoxConstraints.expand(width: 304.0),
        child: Material(
          //elevation参数控制的是Drawer后面的阴影的大小
          elevation: 16.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: _renderRow,
              ),
            ),
          ),
        ));
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index == 0) {
      return Image.network(
        list[0]['img'],
        width: 304.0,
      );
    }
    return ListTile(
      leading: Icon(list[index]['leftImg']),
      title: Text(list[index]['title']),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
