import 'package:flutter/material.dart';

void main() => runApp(new App(
  items: new List<String>.generate(500, (i) => "Item $i"),
));

class App extends StatelessWidget {
  final List<String> items;

  App({Key key, @required this.items}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = ' 长列表示例 ';

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}