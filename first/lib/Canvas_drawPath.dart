import 'package:flutter/material.dart';
import 'dart:ui';

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
        title: new Text('CustomPaint绘制路径示例'),
      ),
      body: new Center(
        child: SizedBox(
          width: 500.0,
          height: 500.0,
          child: CustomPaint(
            painter: LinePainter(),
            child: Center(
              child: Text(
                '绘路径示例',
                style: const TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  
// 继承自 CustomPainter 并且实现 CustomPainter 里面的 paint 和 shouldRepaint 方法
class LinePainter extends CustomPainter {
  // 定义画笔
  Paint _paint = new Paint()
    ..color = Colors.grey
    ..strokeCap =StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke; 
    // 画笔样式有填充 PaintingStyle.fill 及没有填充 PaintinngStyle.stroke 两种

  // 重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    // 新建一个 path 移动到一个位置，然后画各种线
    Path path = new Path() ..moveTo(100.0, 100.0);
    path.lineTo(200.0, 300.0);
    path.lineTo(100.0, 200.0);
    path.lineTo(150.0, 250.0);
    path.lineTo(150.0, 500.0);
    canvas.drawPath(path, _paint);
  }

  // 重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}