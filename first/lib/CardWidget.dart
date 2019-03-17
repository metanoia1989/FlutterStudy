import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var card = new SizedBox(
      height: 250.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                '深圳市南山区深南大道35号',
                style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('创想科技有限公司'),
              leading: new Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                '深圳市罗湖区沿海大道32号',
                style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('一木培训机构'),
              leading: new Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
          ],
        ),
      ),
    );

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card 组件示例'),
        ),
        body: Center(
          child: card,
        ),
      ),
    );
  }
}