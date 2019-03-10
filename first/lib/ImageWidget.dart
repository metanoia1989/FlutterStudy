import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Image Demo',
      home: new ImageDemo(),
    )
  );
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Image.network(
        'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}