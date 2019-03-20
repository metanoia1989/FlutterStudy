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
        title: new Text('ClipRect 圆角矩形裁剪示例'),
      ),
      body: new Center(
        child: new ClipRRect(
          borderRadius: new BorderRadius.all(
            new Radius.circular(30.0),
          ),
          child: new SizedBox(
            width: 300.0,
            height: 300.0,
            child: new Image.asset(
              'assets/images/align_08.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
