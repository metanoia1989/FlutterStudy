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
        title: new Text('页面跳转返回数据示例'),
      ),
      body: new Center(child: new RouteButton(),),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: (){
        _navigateToSecondPage(context);
      },
      child: new Text('跳转到第二个页面'),
    );
  } 

  _navigateToSecondPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SecondPage()),
    );
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$result'),));
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('选择一条数据'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'hi google fluter');
                },
                child: new Text('hi google flutter'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'hi dart fluter');
                },
                child: new Text('hi dart flutter'),
              ),
            )
          ],
        ),
      ),
    );
  } 
}