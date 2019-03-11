import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: 'Scaffold脚手架组件示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 头部元素: 左侧返回按钮 中间标题 右侧菜单
      appBar: AppBar(
        title: Text('Scaffold脚手架组件示例'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text('Scaffold'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: ' 增加 ',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
    );
  }
}