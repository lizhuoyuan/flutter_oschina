/*
 * Created by 李卓原 on 2018/9/14.
 * email: zhuoyuan93@gmail.com
 * 轮播图组件
 */

import 'package:flutter/material.dart';
import 'dart:ui';

class SliderView extends StatefulWidget {
  // data表示轮播图中的数据
  List data;

  SliderView(data) {
    this.data = data;
  }

  // 可以在构造方法中传参供SlideViewState使用
  // 或者也可以不传参数，直接在SlideViewState中通过this.widget.data访问SlideView中的data变量
  @override
  State<StatefulWidget> createState() => SliderViewState(data);
}

class SliderViewState extends State<SliderView>
    with SingleTickerProviderStateMixin {
  // TabController为TabBarView组件的控制器
  TabController tabController;
  List slideData;

  SliderViewState(data) {
    slideData = data;
  }

  @override
  void initState() {
    tabController = TabController(length: slideData.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: tabController,
        children: slideData
            .map((data) => Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.network(
                      data['imgUrl'],
                      width:
                          window.physicalSize.width / window.devicePixelRatio,
                      height: 250.0,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      height: 25.0,
                      width:
                          window.physicalSize.width / window.devicePixelRatio,
                      alignment: Alignment.center,
                      child: Text(
                        data['title'],
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ))
            .toList());
  }
}
