import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CupertnoButton 组件示例'),
        ),
        body: Center(
          child: CupertinoButton(
            child: Text('CupertinnoButton'),
            color: Colors.blue,
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
