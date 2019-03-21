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
    ..strokeWidth = 2.0
    ..style = PaintingStyle.fill ; 
    // 画笔样式有填充 PaintingStyle.fill 及没有填充 PaintinngStyle.stroke 两种

  // 重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    const PI = 3.1415926;
    // 定义矩形
    Rect rect1 = Rect.fromCircle(center: Offset(100.0, 0.0), radius: 100.0);
    // 画 1/2PI弧度的圆弧
    canvas.drawArc(rect1, 0.0, PI / 2, true, _paint);

    // 画 PI 弧度的圆弧
    Rect rect2 = Rect.fromCircle(center: Offset(200.0, 150.0), radius: 100.0);
    canvas.drawArc(rect2, 0.0, PI, true, _paint);

  }

  // 重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}