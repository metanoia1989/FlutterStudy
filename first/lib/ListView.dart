import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter 应用',
      home: LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      new ListTile(
        title: new Text(
          '广州市黄埔大道建中路3号',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        subtitle: new Text('广州市福黄埔大道建中3路'),
        leading: new Icon(
          Icons.fastfood,
          color: Colors.orange,
        ),
      ),
      new ListTile(
        title: new Text(
          '广州市白云区机场路白云机场店',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        subtitle: new Text('广州市白云机场路T3航站楼'),
        leading: new Icon(
          Icons.airplay,
          color: Colors.blue,
        ),
      ),
      new ListTile(
        title: new Text(
          '广州市中山大道中山大学附属医院',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        subtitle: new Text('广州市中山大道45号'),
        leading: new Icon(
          Icons.local_hospital,
          color: Colors.green,
        ),
      ),
      new ListTile(
        title: new Text(
          '广州市天河区太平洋数码城',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        subtitle: new Text('广州市天河区岗顶太平洋数码城'),
        leading: new Icon(
          Icons.computer,
          color: Colors.deepPurple,
        ),
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView布局示例'),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}
