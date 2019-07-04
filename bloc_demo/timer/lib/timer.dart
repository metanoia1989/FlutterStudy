// 定时器小部件将负责显示剩余的时间以及适当的按钮，这些按钮将允许用户启动、暂停和重置定时器。
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/bloc/bloc.dart';
import 'package:timer/actions.dart';
import 'package:timer/background.dart';

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = BlocProvider.of<TimerBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: 
      Stack(
        children: <Widget>[
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder(
                    bloc: _timerBloc,
                    builder: (BuildContext context, TimerState state) {
                      final String minuteStr = ((state.duration / 60) % 60)
                        .floor().toString().padLeft(2, '0');
                      final String secondsStr = (state.duration % 60)
                        .floor().toString().padLeft(2, '0');
                      return Text(
                        '$minuteStr:$secondsStr',
                        style: Timer.timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder(
                bloc: _timerBloc,
                builder: (BuildContext context, TimerState state) {
                  return Actions();
                },
                condition: (prevState, currentState) => 
                  currentState.runtimeType != prevState.runtimeType,
              )
            ],
          ),
        ],
      ),
    );
  }
}