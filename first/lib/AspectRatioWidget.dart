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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AspectRatio调整宽高比示例'),
      ),
      body: new Container(
        height: 200.0,
        child: new AspectRatio(
          aspectRatio: 2, // 比例可以调整
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
