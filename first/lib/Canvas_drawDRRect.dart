import 'package:flutter/material.dart';
import 'dart:math';

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
        title: new Text('CustomPaint绘制圆角矩形示例'),
      ),
      body: new Center(
        child: SizedBox(
          width: 500.0,
          height: 500.0,
          child: CustomPaint(
            painter: LinePainter(),
            child: Center(
              child: Text(
                '绘制圆角矩形',
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
    ..strokeCap =StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.fill ; 
    // 画笔样式有填充 PaintingStyle.fill 及没有填充 PaintinngStyle.stroke 两种

  // 重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    // 初始化两个矩形
    Rect rect1 = Rect.fromCircle(center: Offset(150.0, 150.0), radius: 80.0);
    Rect rect2 = Rect.fromCircle(center: Offset(150.0, 150.0), radius: 40.0);
    // 将矩形转化成圆角矩形
    RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(20.0));
    RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(20.0));
    // 开始绘制嵌套矩形
    canvas.drawDRRect(outer, inner, _paint);
  }

  // 重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}