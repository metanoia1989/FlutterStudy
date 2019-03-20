import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 应用',
      home: new SecondPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('LinearGradient 线性渐变效果'),
      ),
      body: new Center(
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
            ),
          ),
          child: new Container(
            width: 280.0,
            height: 280.0,
            child: new Center(
              child: Text(
                'LinearGradient 线性渐变效果',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('RadialGradient 环形渐变效果'),
      ),
      body: new Center(
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: new RadialGradient(
              center: const Alignment(-0.0, -0.0),
              radius: 0.50,
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
            ),
          ),
          child: new Container(
            width: 280.0,
            height: 280.0,
            child: new Center(
              child: Text(
                'RadialGradient 环形渐变效果',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}