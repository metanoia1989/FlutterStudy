import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Evnet
@immutable
abstract class SettingsEvent extends Equatable {}
class TemperatureUnitsToggled extends SettingsEvent {}

enum TemperatureUnits { fahrenheit, celsius }

// State
@immutable
class SettingsState extends Equatable {
  final TemperatureUnits temperatureUnits;
  SettingsState({@required this.temperatureUnits}) 
    : assert(temperatureUnits != null),
      super([TemperatureUnits]);
}

// Bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => 
    SettingsState(temperatureUnits: TemperatureUnits.celsius);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is TemperatureUnitsToggled) {
      yield SettingsState(
        temperatureUnits:
          currentState.temperatureUnits == TemperatureUnits.celsius
            ? TemperatureUnits.fahrenheit
            : TemperatureUnits.celsius,
      ); 
    }
  }
}