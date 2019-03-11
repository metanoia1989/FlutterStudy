import 'package:flutter/material.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        // 主题色
        primarySwatch: Colors.green,
      ),
      home: new HomePage(),
      title: 'MaterialApp 示例',
      routes: {
        '/first': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
      },
      initialRoute: '/second',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp 示例'),
      ),
      body: Center(
        child: Text(
          ' 主页 ',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}

// 第一个路由页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(' 这是第一页 '),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            ' 这是第一页 ',
            style:TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}

// 第二个路由页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(' 这是第二页 '),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          child: Text(
            ' 这是第二页 ',
            style:TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}