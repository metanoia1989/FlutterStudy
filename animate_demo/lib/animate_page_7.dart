import 'package:flutter/material.dart';

class AnimatePage7 extends StatefulWidget {
  AnimatePage7({Key key}) : super(key: key);

  _AnimatePage7State createState() => _AnimatePage7State();
}

class _AnimatePage7State extends State<AnimatePage7> {
  IconData _actionIcon = Icons.delete;
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画1'),
        actions: <Widget>[
          AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            duration: Duration(milliseconds: 300),
            child: IconButton(
              key: ValueKey(_actionIcon),
              icon: Icon(_actionIcon),
              onPressed: () {
                setState(() {
                 if (_actionIcon == Icons.delete) {
                   _actionIcon = Icons.done;
                 } else {
                   _actionIcon = Icons.delete;
                 }
                });
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation){
                  // return ScaleTransition(child: child, scale: animation);
                  return MySlideTransition(position: animation, child: child);
                },
                child: Text(
                  '$_count',
                  key: ValueKey<int>(_count),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              RaisedButton(
                child: Text('+1'),
                onPressed: () {
                  setState(() {
                    _count += 1; 
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> _tween;

  MySlideTransition({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  }) : assert(position != null),
       super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0)); 
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0)); 
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0)); 
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0)); 
        break;
      default:
    }     
  }


  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    //动画反向执行时，调整x偏移，实现”从左边滑出隐藏“
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}