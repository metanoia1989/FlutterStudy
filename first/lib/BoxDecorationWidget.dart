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
        title: new Text('BoxDecoration装饰盒子 - 背景图示例'),
      ),
      body: new Center(
        child: new Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: ExactAssetImage('assets/images/align_01.jpg'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.green, width: 4.0),
            borderRadius: BorderRadius.circular(36.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 8.0,
                spreadRadius: 8.0,
                offset: Offset(-1.0, 1.0),
              ),
            ],
          ),
          child: new Text(
            'hello', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
        ),
      ),
    );
  }
}