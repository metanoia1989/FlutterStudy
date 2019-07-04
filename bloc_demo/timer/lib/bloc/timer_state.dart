import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


// Ready - 从指定的持续时间开始倒计时，启动 timer
// Running - 从指定的持续时间开始主动倒计时，能够暂停和重置计时器以及查看剩余的持续时间
// Pause - 暂停一段时间，能够恢复计时器并重置计时器。
// Finished - 完成，剩余时间为0，将能够重置计时器。

@immutable 
abstract class TimerState extends Equatable {
  final int duration;

  TimerState(this.duration, [List props = const []])
    : super([duration]..addAll(props));
}

class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready { duration: $duration }';
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);

  @override
  String toString() => 'Paused { duration: $duration}';
}

class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';
}

class Finished extends TimerState {
  Finished() : super(0);

  @override
  String toString() => 'Finished';
}