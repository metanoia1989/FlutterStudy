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
    // 中心点坐标为 200,200 边长为1000
    Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0), radius: 100.0);
    // 根据矩形创建一个角度为20的圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
    // 开始绘制圆角矩形
    canvas.drawRRect(rrect, _paint);
  }

  // 重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}