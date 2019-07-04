import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Start - 通知TimerBloc应该启动定时器。
// Pause - 通知TimerBloc应暂停定时器。
// Resume - 通知TimerBloc应该恢复计时器。
// Reset - 通知TimerBloc应将定时器复位到原始状态。
// Tick - 告知TimerBloc发生了勾号，并且需要相应地更新其状态。

@immutable 
abstract class TimerEvent extends Equatable {
  TimerEvent([List props = const []]) : super(props);
}

class Start extends TimerEvent {
  final int duration;

  Start({@required this.duration}) : super([duration]);

  @override
  String toString() => 'Start { duration: $duration }';
}

class Pause extends TimerEvent {
  @override
  String toString() => 'Pause';
}

class Resume extends TimerEvent {
  @override
  String toString() => 'Resume';
}

class Reset extends TimerEvent {
  @override
  String toString() => 'Reset';
}

class Tick extends TimerEvent {
  final int duration;

  Tick({@required this.duration}) : super([duration]);

  @override
  String toString() => 'Tick { duration: $duration }';
}