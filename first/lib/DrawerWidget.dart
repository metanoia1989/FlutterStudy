import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: 'Drawer 抽屉组件示例 应用名',    
  home: new LayoutDemo(),
));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer 抽屉组件示例 文件头12'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // 设置用户信息、头像、用户名和Email 等
            UserAccountsDrawerHeader(
              accountName: new Text(' 玄微子 '),
              accountEmail: new Text('xuanweizi@163.com'),
              // 设置当前用户头像
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('assets/images/avatar.jpg'),
              ),
              onDetailsPressed: () {},
              // 设置当前用户的其他账号，这里展示二维码
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('assets/images/qrcode.png'),
                ),
              ],
            ) ,
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens)), // 导航栏菜单
              title: Text(' 个性装扮 '),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo)), // 导航栏菜单
              title: Text(' 我的相册 '),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi)), // 导航栏菜单
              title: Text(' 免流量特权 '),
            ),
          ],
        ),
      ),
    );
  }
}