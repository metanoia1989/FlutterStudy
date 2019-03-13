import 'package:flutter/material.dart';

void main() {
  runApp(new DefaultTabControllerSample());
}

class DefaultTabControllerSample extends StatelessWidget {
  // 选项卡数据
  final List<Tab> tabs = <Tab>[
    Tab(text: '选项卡一'),
    Tab(text: '选项卡二'),
    Tab(text: '选项卡三'),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 用来组装 TabBar 及 TabBarView
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
          // 添加导航栏
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map(
              (Tab tab) => Center(child: Text(tab.text))
            ).toList(),
          ),
        ),
      ),
    );
  }
}