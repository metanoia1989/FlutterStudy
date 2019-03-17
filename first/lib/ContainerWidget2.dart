import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Container 布局容器示例',
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 返回一个Container对象
    Widget container = new Container(
      // 添加装饰效果
      decoration: new BoxDecoration(
        color: Colors.grey,
      ),
      // 子元素指定为一个垂直水平嵌套布局的组件
      child: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            // 使用 Expanded 防止内容溢出
            new Expanded(
              child: new Container(
                width: 150.0,
                height: 150.0,
                // 添加边框样式
                decoration: new BoxDecoration(
                  // 上下左右边框设置为宽度10.0， 颜色为蓝灰色
                  border: new Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: 
                    const BorderRadius.all(const Radius.circular(8.0)),
                ),
                // 上下左右添加边距
                margin: const EdgeInsets.all(4.0),
                // 添加图片
                child: new Image.asset('assets/images/container_01.jpg'),
              ),
            ),
            new Expanded(
              child: new Container(
                width: 150.0,
                height: 150.0,
                // 添加边框样式
                decoration: new BoxDecoration(
                  // 上下左右边框设置为宽度10.0， 颜色为蓝灰色
                  border: new Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: 
                    const BorderRadius.all(const Radius.circular(8.0)),
                ),
                // 上下左右添加边距
                margin: const EdgeInsets.all(4.0),
                // 添加图片
                child: new Image.asset('assets/images/container_02.jpg'),
              ),
            ),
          ]),
          new Row(children: <Widget>[
            // 使用 Expanded 防止内容溢出
            new Expanded(
              child: new Container(
                width: 150.0,
                height: 150.0,
                // 添加边框样式
                decoration: new BoxDecoration(
                  // 上下左右边框设置为宽度10.0， 颜色为蓝灰色
                  border: new Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: 
                    const BorderRadius.all(const Radius.circular(8.0)),
                ),
                // 上下左右添加边距
                margin: const EdgeInsets.all(4.0),
                // 添加图片
                child: new Image.asset('assets/images/container_03.jpg'),
              ),
            ),
            new Expanded(
              child: new Container(
                width: 150.0,
                height: 150.0,
                // 添加边框样式
                decoration: new BoxDecoration(
                  // 上下左右边框设置为宽度10.0， 颜色为蓝灰色
                  border: new Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: 
                    const BorderRadius.all(const Radius.circular(8.0)),
                ),
                // 上下左右添加边距
                margin: const EdgeInsets.all(4.0),
                // 添加图片
                child: new Image.asset('assets/images/container_04.jpg'),
              ),
            ),
          ]),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Container布局容器示例'),
      ),
      body: container,
    );
  }
}