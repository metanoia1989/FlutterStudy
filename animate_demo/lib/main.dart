import 'package:flutter/material.dart';

import 'animate_page_1.dart';
import 'animate_page_2.dart';
import 'animate_page_3.dart';
import 'animate_page_4.dart';
import 'animate_page_5.dart';
import 'animate_page_6.dart';
import 'animate_page_7.dart';
import 'animate_page_8.dart';
import 'animate_page_9.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              child: Text('动画页面1 使用 addListener 和 setState'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage1();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面2 使用 AnimatedWidget 组件'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage2();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面3 使用 AnimatedBuilder 组件'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage3();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面4 多个动画 Parallel animation'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage4();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面5 交织动画 Stagger animation'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage5();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面6 AnimaetdWidget Api 组件 RotationTransition'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage6();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面7 AnimaetdSwitcher 通用切换动画'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage7();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面8 动画过度组件'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage8();
                  }
                ));
              },
            ),
            FlatButton(
              child: Text('动画页面9 动画过渡组件集合'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AnimatePage9();
                  }
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
