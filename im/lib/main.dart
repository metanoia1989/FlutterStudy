import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './app.dart';
import './loading.dart';
import './search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '聊天室',
      theme: ThemeData(
        primarySwatch: Colors.green,  
        scaffoldBackgroundColor: Color(0xFFebbeb),
        cardColor: Colors.green,
      ),
      // 添加路由表
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/friends": (_) => new WebviewScaffold(
          url: "https://flutter.io",
          appBar: new AppBar(
            title: new Text("Flutter官网"),
          ),
          withZoom: true,
          withLocalStorage: true,
        ),
        "search": (BuildContext context) => new Search(), // 搜索页面
      },
      // 指定首页，默认为加载页面   
      home: new LoadingPage(),
    );
  }
}
