import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 应用',
      home: new FirstPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('ClipRect 矩形裁剪示例'),
      ),
      body: new Center(
        child: new ClipRect(
          clipper: new RectClipper(), // 自定义clipper
          child: new SizedBox(
            width: 300.0,
            height: 300.0,
            child: new Image.asset(
              'assets/images/align_09.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}


// 自定义 clipper 类型为 Rect
class RectClipper extends CustomClipper<Rect>{
  // 重写获取剪取范围
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(100.0, 100.0, size.width - 100.0, size.height - 100.0);
  }

  // 重写是否重新裁剪
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) { 
    return true;
  }
}