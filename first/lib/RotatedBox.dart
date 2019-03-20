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
        title: new Text('RotatedBox 旋转盒子'),
      ),
      body: new Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'RotatedBox 旋转盒子',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}
