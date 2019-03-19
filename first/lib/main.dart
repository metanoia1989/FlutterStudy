import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 应用',
      theme: new ThemeData(
        brightness: Brightness.light, // 应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[600], // App 主要部分的背景色
        accentColor: Colors.orange[600], // 前景色 文本按钮等
      ),
      home: LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 风景区地址部分
    Widget addressContainer = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 顶部对齐
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '风景区地址',
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Text(
                  '湖北省十堰市丹江口市',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('66'),
        ],
      ),
    );

    // 构建按钮组中单个按钮 参数为图标及文本
    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, // 垂直方向大小最小化
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen[600]), // 上面图标部分
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(  // 下面文字部分
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600],
              ),
            ),
          ),
        ],
      );
    }

    // 按钮组部分
    Widget buttonsContainer = Container(
      // 容器横向布局
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向均匀排列每个元素
        children: <Widget>[
          buildButtonColumn(Icons.call, '电话'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );

    // 风景区介绍文本部分
    Widget textContainer = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
        管子曰：令有時，無時，則必視順天之所以來，五漫漫，六惛惛，庸知之哉？
        唯聖人知四時。不知四時，乃失國之基。不知五穀之故，國家乃路故天曰信明，地曰信聖，四時曰正，其王信明聖，其臣乃正。
        何以知其王之信明信聖也曰慎使能而善聽信之。使能之謂明，聽信之謂聖，信明聖者，皆受天賞，使不能為惛，惛而忘也者，皆受天禍。
        是故上見成事而貴功，則民事接勞而不謀。上見功而賤，則為人下者直，為人上者驕。
        是故陰陽者，天地之大理也，四時者，陰陽之大經也。
        刑德者，四時之合也。刑德合於時，則生福；詭則生禍。
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '武当山风景区',
          style: TextStyle(color: Colors.white)
        ),
      ),
      body: new ListView(
        children: <Widget>[
          Image.asset(
            'assets/images/align_02.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          addressContainer,
          buttonsContainer,
          textContainer,
        ],
      ),
    );
  }
}
