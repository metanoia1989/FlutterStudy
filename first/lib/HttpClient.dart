import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(new App());

class App extends StatelessWidget {
  //获取天气数据
  void getWeachterData() async {
    try {
      HttpClient httpClient = new HttpClient();
      // Uri uri =Uri(scheme: 'http', host: 't.weather.sojson.com', queryParameters: {
      //   '_id': 26,
      //   'city_code': '101030100',
      //   'city_name': '天津'
      // });
      // HttpClientRequest request = await httpClient.getUrl(uri);
      HttpClientRequest request = await httpClient.getUrl(
        Uri.parse('http://t.weather.sojson.com/api/weather/city/101030100')
      );
      HttpClientResponse res = await request.close();
      String result = await res.transform(utf8.decoder).join();
      print(result);
      httpClient.close();
    } catch (e) {
      print("请求失败: $e");
    } finally {
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'httpclient 请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('httpclient 请求'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(' 获取天气数据 '),
            onPressed: getWeachterData,
          ),
        ),
      ),
    );
  }  
}