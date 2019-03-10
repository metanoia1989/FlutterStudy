import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[600],
        accentColor: Colors.orange[600],
        buttonColor: Colors.pink,
      ),
      home: new HomePage(
        title: appName,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          // 获取主题的 accentColor
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
        // 使用 copyWith 的方式获取 accentColor
        data: Theme.of(context).copyWith(accentColor: Colors.grey),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.computer),
        ),
      ),
    );
  }
}