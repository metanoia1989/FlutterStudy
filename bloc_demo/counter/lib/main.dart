import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/bloc/SimpleBlocDelegate.dart';
import 'package:bloc_demo/bloc/CounterBloc.dart';
import 'package:bloc_demo/bloc/ThemeBloc.dart';
import 'package:bloc_demo/CounterPage.dart';

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProviderTree(
      blocProviders: [
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
        ),
        BlocProvider<ThemeBloc>(
          builder: (context) => ThemeBloc(),
        )
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (_, ThemeData theme) {
        return MaterialApp(
          title: 'Bloc Counter Demo',
          home: CounterPage(),
          theme: theme,
        );
      },
    );
  }
}

