import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // 当前选中的索引项
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigatorBar 示例'),
      ),
      body: Center(
        // 居中显示某一个文本
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text(' 信息 ')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text(' 通讯录 ')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text(' 发现 ')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple, // 选中项的颜色
        onTap: _onItemTapped, // 按下触发的函数
      ),
    );
  }

  // 设置当前索引为 index 值
  void _onItemTapped(int index) {
    setState(() {
     _selectedIndex = index; 
    });
  }
}