import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = " 网格列表示例 ";

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new GridView.count(
          primary: false,
          padding: const EdgeInsets.all(60.0), 
          crossAxisSpacing: 30.0,
          crossAxisCount: 3,
          children: <Widget>[
            const Text('第一行第一列'),
            const Text('第一行第二列'),
            const Text('第一行第三列'),
            const Text('第二行第一列'),
            const Text('第二行第二列'),
            const Text('第二行第三列'),
            const Text('第三行第一列'),
            const Text('第三行第二列'),
            const Text('第三行第三列'),
            const Text('第四行第一列'),
            const Text('第四行第二列'),
            const Text('第四行第三列'),
          ],
        ),
      ),
    );
  }
}