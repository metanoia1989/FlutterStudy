import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加文本编辑控制器 监听文本输入内容变化
    final TextEditingController controller =TextEditingController();
    controller.addListener(() {
      print('你输入的内容为：${controller.text}');
    });

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField组件示例'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              // 绑定 controller
              controller: controller,
              // 最大长度
              maxLength: 30,
              // 最大行数
              maxLines: 1,
              // 是否自动更正
              autocorrect: true,
              // 是否自动对焦
              autofocus: true,
              // 是否是密码
              obscureText: false,
              // 文本对齐方式
              textAlign: TextAlign.center,
              // 输入文本的样式
              style: TextStyle(fontSize: 26.0, color: Colors.green),
              // 文本内容改变时回调
              onChanged: (text) {
                print('文本内容改变时回调 $text');
              },
              // 内容提交时回调
              onSubmitted: (text) {
                print('文本提交时回调 $text');
              },
              enabled: true, // 是否启用
              // 添加装饰效果
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200, // 添加灰色填充色
                filled: true,
                helperText: '用户名',
                // 左侧图标
                prefixIcon: Icon(Icons.person),
                // 右侧提示文本
                suffixText: '用户名'
              ),
            ),
          ),
        ),
      ),
    );
  }
}