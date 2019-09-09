import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatePage8 extends StatefulWidget {
  AnimatePage8({Key key}) : super(key: key);

  _AnimatePage8State createState() => _AnimatePage8State();
}

class _AnimatePage8State extends State<AnimatePage8> {
  Color _decorationColor = Colors.blue;
  Duration duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画1'),
      ),
      body: Container(
        color: Colors.white,
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: BoxDecoration(color: _decorationColor),
          child: FlatButton(
            child: Text('动画装饰盒子', style: TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
               _decorationColor = Colors.red; 
              });
            },
          ),
        ),
      ),
    );
  }
}



class AnimatedDecoratedBox1 extends StatefulWidget {
  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  }) : super(key: key);

  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1> 
    with SingleTickerProviderStateMixin {
  
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;
  Animation<double> get animation => _animation;
  Animation<double> _animation;
  DecorationTween _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;

    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller 
        ..value = 0.0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
    );
  }
}