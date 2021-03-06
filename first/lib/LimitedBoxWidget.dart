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
        title: new Text('LimitedBox限定宽高布局示例'),
      ),
      body: new Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 150.0, // 设置最大宽度
            child: Container(
              color: Colors.lightGreen,
              width: 250.0,
            ),
          ),
        ],
      ),
    );
  }
}
