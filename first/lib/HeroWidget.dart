import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 应用',
      home: new FirstPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('页面切换动画图一'),
      ),
      body: new GestureDetector(
        child: new Hero(
          tag: '第一张图片',
          child: new Image.network('https://images.unsplash.com/photo-1552855320-64fe5ae94d35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (_){
            return new SecondPage();
          }));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('页面切换动画图二'),
      ),
      body: new GestureDetector(
        child: new Hero(
          tag: '第二张图片',
          child: new Image.network('https://images.unsplash.com/photo-1553060146-71667aa3f223?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}