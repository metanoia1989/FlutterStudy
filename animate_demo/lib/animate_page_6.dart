import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatePage6 extends StatefulWidget {
  AnimatePage6({Key key}) : super(key: key);

  _AnimatePage6State createState() => _AnimatePage6State();
}

class _AnimatePage6State extends State<AnimatePage6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画6'),
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
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
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
    return RotationTransition(
      turns: animation,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
