/*
 * Created by 李卓原 on 2018/9/14.
 * email: zhuoyuan93@gmail.com
 * 轮播图组件
 */

import 'dart:async';

import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  // data表示轮播图中的数据
  List data;

  //自动轮播
  bool autoPlay;

  //自动轮播时间(毫秒)
  int autoPlayTime;

  SliderView(data, {bool autoPlay = false, int autoPlayTime = 5000}) {
    this.data = data;
    this.autoPlay = autoPlay;
    this.autoPlayTime = autoPlayTime;
  }

  // 可以在构造方法中传参供SlideViewState使用
  // 或者也可以不传参数，直接在SlideViewState中通过this.widget.data访问SlideView中的data变量
  @override
  State<StatefulWidget> createState() => SliderViewState();
}

class SliderViewState extends State<SliderView>
    with SingleTickerProviderStateMixin {
  // TabController为TabBarView组件的控制器
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: widget.data.length, vsync: this);
    super.initState();
    if (this.widget.autoPlay) autoplay();
  }

  void autoplay() {
    Timer.periodic(Duration(milliseconds: widget.autoPlayTime ?? 5000),
        (timer) {
      if (tabController.index == widget.data.length - 1) {
        tabController.index = 0;
      } else {
        tabController.index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: tabController,
        children: widget.data
            .map((data) => Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.network(
                      data['imgUrl'],
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      height: 25.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        data['title'],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis, // 溢出显示。。。
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ))
            .toList());
  }
}
