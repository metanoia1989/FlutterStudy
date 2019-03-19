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
    // 使用 generate 构造图片列表
    List<Container> _buildGridTitleList(int count) {
      return new List<Container>.generate(count, (int index) {
        return new Container(
          child: new Image.asset('assets/images/align_0${index + 1}.jpg'),
        );
      });
    }

    // 渲染 GridView
    Widget buildGrid() {
      return new GridView.extent(
        maxCrossAxisExtent: 150.0, // 次轴的宽度
        padding: const EdgeInsets.all(4.0), // 上下左右内边距
        mainAxisSpacing: 4.0, // 主轴间隙 
        crossAxisSpacing: 4.0, // 次轴间隙
        children:_buildGridTitleList(9), // 添加9个元素
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridView九宫格示例'),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}
