import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatePage4 extends StatefulWidget {
  AnimatePage4({Key key}) : super(key: key);

  _AnimatePage4State createState() => _AnimatePage4State();
}

class _AnimatePage4State extends State<AnimatePage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画3'),
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
      duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
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
    return AnimatedLogo(animation: animation);
  }
}


class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key key, Animation<double> animation}) 
    : super(key: key, listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}