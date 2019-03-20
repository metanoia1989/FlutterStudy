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
  // 构建30条列表数据
  List<String> items = new List<String>.generate(30, (i) => "列表项 ${i+1}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '滑动删除示例',
          style: TextStyle(color: Colors.white)
        ),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          // 返回一个可以被删除的列表项
          return new Dismissible(
            key: new Key(item),
            // 被删除回调
            onDismissed: (direction) {
              // 移除指定索引项
              items.removeAt(index);
              // 底部弹出消息提示框当前项被删除了
              Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("$item 被删除了"),)
              );
            },
            child: new ListTile(title: new Text('$item'),),
          );
        },
      ),
    );
  }
}
