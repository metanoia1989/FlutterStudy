import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog组件示例'),
        ),
        body: Center(
          child: SimpleDialog(
            title: const Text('data对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () { },
                child: const Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: () { },
                child: const Text('第二信息'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}