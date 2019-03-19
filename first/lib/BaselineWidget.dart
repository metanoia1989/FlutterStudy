import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter 应用',
      home: LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Table 表格布局示例'),
      ),
      body: new Row(
        // 水平等间距排序子组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 设置基准线
          new Baseline(
            baseline: 80.0,
            // 对齐字符底部水平
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'AbBbCc',
              style: new TextStyle(
                fontSize: 18.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          new Baseline(
            baseline: 80.0,
            // 对齐字符底部水平
            baselineType: TextBaseline.alphabetic,
            child: new Container(
              width: 40.0,
              height: 40.0,
              color: Colors.green,
            ),
          ),
          new Baseline(
            baseline: 80.0,
            // 对齐字符底部水平
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'DdEeFf',
              style: new TextStyle(
                fontSize: 26.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
