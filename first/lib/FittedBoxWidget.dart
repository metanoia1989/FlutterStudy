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
        title: new Text('FittedBox缩放布局示例'),
      ),
      body: new Container(
        color: Colors.grey, 
        width: 250.0,
        height: 250.0,
        child: new FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft,
          child: new Container(
            color: Colors.deepOrange,
            child: new Text('缩放布局'),
          ),
        ),
      ),
    );
  }
}
