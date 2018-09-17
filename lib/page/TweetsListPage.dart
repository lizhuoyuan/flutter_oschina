/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * 动弹!
 */

import 'package:flutter/material.dart';

class TweetsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TweetListState();
}

class TweetListState extends State<TweetsListPage> {
  List hotList = [];
  List normalList = [];

  @override
  void initState() {
    setState(() {
      // 添加测试数据
      for (int i = 0; i < 20; i++) {
        Map<String, dynamic> map = new Map();
        // 动弹发布时间
        map['pubDate'] = '2018-7-30';
        // 动弹文字内容
        map['body'] =
            '早上七点十分起床，四十出门，花二十多分钟到公司，必须在八点半之前打卡；下午一点上班到六点，然后加班两个小时；八点左右离开公司，呼呼登自行车到健身房锻炼一个多小时。到家已经十点多，然后准备第二天的午饭，接着收拾厨房，然后洗澡，吹头发，等能坐下来吹头发时已经快十二点了。感觉很累。';
        // 动弹作者昵称
        map['author'] = '红薯';
        // 动弹评论数
        map['commentCount'] = 10;
        // 动弹作者头像URL
        map['portrait'] =
            'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
        // 动弹中的图片，多张图片用英文逗号隔开
        map['imgSmall'] =
            'https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg';
        hotList.add(map);
        normalList.add(map);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  '动弹列表',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  '热门动弹',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: TabBarView(children: [
              _renderTabView(normalList),
              _renderTabView(hotList)
            ]),
          )),
    );
  }

  Widget _renderTabView(List list) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          _renderItem(context, index, list),
      itemCount: list.length * 2,
    );
  }

  Widget _renderItem(BuildContext context, int index, List list) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    Row firstRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000'),
          radius: 10.0,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
            child: Text(list[index]['author'],
                style: new TextStyle(fontSize: 16.0))),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '${list[index]['commentCount']}',
            ),
            Icon(
              Icons.comment,
              color: Colors.grey,
            )
          ],
        )),
      ],
    );
    //文字
    var contentRow = new Container(
        padding: EdgeInsets.only(left: 26.0, right: 10.0, top: 5.0),
        child: new Text(list[index]['body']));

    // 动弹中的图片数据，字符串，多张图片以英文逗号分隔
    String imgSmall = list[index]['imgSmall'];
    List<String> imglist = imgSmall.split(",");

    GridView gd = GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 80.0,
          height: 80.0,
          child: Image.network(
            imglist[index],
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: imglist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
    Column columns = Column(
      children: <Widget>[
        firstRow,
        contentRow,
        Container(
          child: gd,
          padding: EdgeInsets.all(26.0),
          height: getRow(imglist.length) * 140.0,
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Text(list[index]['pubDate'])],
          ),
        )
      ],
    );
    return Container(
      padding: EdgeInsets.all(5.0),
      child: columns,
    );
  }

  // 获取行数，n表示图片的张数
  // 如果n取余不为0，则行数为n取整+1，否则n取整就是行数
  int getRow(int n) {
    int a = n % 3; // 取余
    int b = n ~/ 3; // 取整
    if (a != 0) {
      return b + 1;
    }
    return b;
  }
}
