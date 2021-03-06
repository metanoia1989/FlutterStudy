import 'package:flutter/material.dart';
// import 'package:permissions_demo/permiss_page1.dart';
// import 'package:permissions_demo/permiss_page2.dart';
import 'package:permissions_demo/permiss_page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('跳转 permission handler 库页面'),
              onPressed: () {
                // Navigator.of(context).push(new MaterialPageRoute(
                //   builder: (BuildContext context) => new PermissPage1(),
                // ));
              },
            ),
            FlatButton(
              child: Text('跳转 simple permission 库页面'),
              onPressed: () {
                // Navigator.of(context).push(new MaterialPageRoute(
                //   builder: (BuildContext context) => new PermissPage2(),
                // ));
              },
            ),
            FlatButton(
              child: Text('跳转 permission 库页面'),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PermissPage3(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
