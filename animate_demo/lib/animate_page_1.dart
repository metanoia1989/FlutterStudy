import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatePage1 extends StatefulWidget {
  AnimatePage1({Key key}) : super(key: key);

  _AnimatePage1State createState() => _AnimatePage1State();
}

class _AnimatePage1State extends State<AnimatePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画1'),
      ),
      body: Container(
        color: Colors.white,
        child: Logo(),
      ),
    );
  }
}

class Logo extends StatefulWidget {
  Logo({Key key}) : super(key: key);

  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Container(
         margin: EdgeInsets.symmetric(vertical: 10.0),
         height: animation.value,
         width: animation.value,
         child: FlutterLogo(),
       ),
    );
  }
}