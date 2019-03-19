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
        title: new Text('FractionallySizedBox百分比布局示例'),
      ),
      body: new  Container(
        color: Colors.blueGrey,
        height: 200.0,
        width: 200.0,
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 0.5,
          heightFactor: 1.5,
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
