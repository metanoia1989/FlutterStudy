import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/blocs.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')), 
      body: ListView(
        children: <Widget>[
          BlocBuilder(
            bloc: settingsBloc,
            builder: (BuildContext context, SettingsState state) {
              return ListTile(
                title: Text(
                  'Tempeerature Units',
                ),
                isThreeLine: true,
                subtitle: 
                  Text('Use tric measurements for temperature units'),
                trailing: Switch(
                  value: state.temperatureUnits == TemperatureUnits.celsius,
                  onChanged: (_){
                    settingsBloc.dispatch(TemperatureUnitsToggled());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}