import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(   
      title: 'http请求示例',
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('http请求示例'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () {
              const url = 'http://httpbin.org';
              http.get(url).then((res) {
                print("状态: ${res.statusCode}");
                print("正文: ${res.body}");
              });
            },
            child: new Text('发起http请求'),
          ),
        ),
      ),
    );
  }
}