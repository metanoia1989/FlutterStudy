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
        title: new Text('ClipPath 1 路径裁剪示例'),
      ),
      body: new Center(
        child: new ClipPath(
          clipper: new TriangleCliper(), // 自定义clipper
          child: new SizedBox(
            width: 100.0,
            height: 100.0,
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
class TriangleCliper extends CustomClipper<Path>{
  // 重写获取剪取范围
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(50.0, 50.0); // 起始点
    path.lineTo(50.0, 50.0); // 终止点
    path.lineTo(100.0, 100.0); // 起始点 （50， 10） 终止点
    path.close(); 
    return path;
  }

  // 重写是否重新裁剪
  @override
  bool shouldReclip(TriangleCliper oldClipper) { 
    return true;
  }
}