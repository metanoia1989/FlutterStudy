import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 应用',
      home: new HomePage(title: '淡入淡出动画示例'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        // 添加 Opacity 动画
        child: new AnimatedOpacity(
          // 控制 opacity 值，范围从 0.0 到 1.0
          opacity: _visible ? 1.0 : 0.0,
          // 设置动画时长
          duration: new Duration(
            milliseconds: 1000,
          ),
          child: new Container(
            width: 300.0,
            height: 300.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          // 控制动画显示状态
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: '显示隐藏',
        child: new Icon(Icons.flip),
      ),
    );
  }
}


