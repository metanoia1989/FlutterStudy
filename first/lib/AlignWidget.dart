import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Align 对齐布局示例',
      home: LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Align 对齐布局示例'),
      ),
      body: new Stack(
        children: <Widget>[
          // 左上角
          new Align(
            alignment: new FractionalOffset(0.0, 0.0),
            child: new Image.asset('assets/images/align_01.jpg', width: 128.0, height: 128.0),
          ),
          // 右上角
          new Align(
            alignment: FractionalOffset(1.0, 0.0),
            child: new Image.asset('assets/images/align_02.jpg', width: 128.0, height: 128.0),
          ),
          // 水平垂直方向居中
          new Align(
            alignment: FractionalOffset.center,
            child: new Image.asset('assets/images/align_03.jpg', width: 128.0, height: 128.0),
          ),
          // 左下角
          new Align(
            alignment: FractionalOffset.bottomLeft,
            child: new Image.asset('assets/images/align_04.jpg', width: 128.0, height: 128.0),
          ),
          // 右下角
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.asset('assets/images/align_05.jpg', width: 128.0, height: 128.0),
          ),
        ],
      ),
    );
  }
}