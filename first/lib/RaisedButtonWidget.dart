import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RaisedButton示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RaisedButton 组件示例'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () {
              // 
            },
            child: new Text(' RaisedButton 组件'),
          ),
        ),
      ),
    );
  }
}