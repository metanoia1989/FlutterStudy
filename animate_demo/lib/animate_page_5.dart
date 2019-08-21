import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatePage5 extends StatefulWidget {
  AnimatePage5({Key key}) : super(key: key);

  _AnimatePage5State createState() => _AnimatePage5State();
}

class _AnimatePage5State extends State<AnimatePage5> {
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
    controller.addStatusListener((status) {
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
    return StaggerAnimation(controller: controller); 
  }
}

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0, end: 300.0).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));

    color = ColorTween(begin: Colors.green, end: Colors.red).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0), 
      end: EdgeInsets.only(left: 100.0)
    ).animate(CurvedAnimation(
      parent: controller, 
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50.0,
            height: height.value,
          ),
        );
      },
    );
  }
}