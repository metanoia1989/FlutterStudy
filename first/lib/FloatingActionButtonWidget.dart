import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton 示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatinngActionButton是咋样的'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton在这里',
            style:TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
            child: const Icon(Icons.add),
            // 提示信息
            tooltip: ' 请点击FloatingActionButton',
            // 前景色为白色
            foregroundColor: Colors.white,
            // 背景色为蓝色
            backgroundColor: Colors.blue,
            // 未点击阴影值
            highlightElevation: 14.0,
            onPressed: () {
              // 点击回调事件 弹出一句提示语
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('你点击了FloatingActionnButton'),
              ));
            },
            mini: false,
            // 圆形边
            shape: new CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: 
          // 居中放置 位置可以设置成左中右
          FloatingActionButtonLocation.centerFloat,
      )
    );
  }
}