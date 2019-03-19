import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter 应用',
      home: LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      // 子组件左上角对齐
      alignment: Alignment.topLeft,
      children: <Widget>[
        // 底部添加一个头像
        new CircleAvatar(
          backgroundImage: new AssetImage('assets/images/align_09.jpg'),
          radius: 100.0,
        ),
        // 上面加一个容器，容器里再放一段文本
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Text(
            '我是超级飞侠',
            style: new TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,    
              color: Colors.white,
            ),
          ),
        ),
      ],
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack层叠布局示例'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}
