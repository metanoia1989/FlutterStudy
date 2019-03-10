import 'package:flutter/material.dart';

void main() => runApp(new App2 ());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = " 基础列表示例 ";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: new AppBar(
          title: Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
}

class App2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = ' 水平列表示例 ';
    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.lightBlue,
              ),
              Container(
                width: 160.0,
                color: Colors.amber,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Text(
                      '水平',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      ),
                    ),
                    Text(
                      ' 列表 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      ),
                    ),
                    Icon(Icons.list),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.black,
              ),
              Container(
                width: 160.0,
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


