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
        title: new Text('CustomPaint绘制多个点示例'),
      ),
      body: new Center(
        child: SizedBox(
          width: 500.0,
          height: 500.0,
          child: CustomPaint(
            painter: LinePainter(),
            child: Center(
              child: Text(
                '绘多个点示例',
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
    ..strokeWidth = 20.0
    ..style = PaintingStyle.fill ; 
    // 画笔样式有填充 PaintingStyle.fill 及没有填充 PaintinngStyle.stroke 两种

  // 重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制点
    canvas.drawPoints(
      // PointMode 的枚举类型有三个，points 点、lines 隔点连接线、polygon相邻连接线
      // PointMode.points, 
      // PointMode.lines, 
      PointMode.polygon, 
      [
        Offset(50.0, 60.0),
        Offset(40.0, 90.0),
        Offset(100.0, 100.0),
        Offset(300.0, 350.0),
        Offset(400.0, 80.0),
        Offset(200.0, 200.0),
      ], 
      _paint..color = Colors.grey);
  }

  // 重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}