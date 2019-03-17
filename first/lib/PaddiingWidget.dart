import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Center 居中布局示例',
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Center 居中布局示例'),
      ),
      body: new Center(
        child: new Container(
          width: 300.0,
          height: 300.0,
          padding: EdgeInsets.all(6.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
              color: Colors.green,
              width: 8.0
            ),
          ),
          child: new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                color: Colors.blue,
                width: 8.0
              ),
            ),
            child: new FlutterLogo(),
          ),
        ),
      ),
    );
  }
}