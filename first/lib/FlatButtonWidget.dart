import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlatButton 扁平按钮组件示例'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'FlatButton',
              style:TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}