import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login/res/user_repository.dart';
import 'package:login/bloc/authentication/authentication.dart';

import 'package:login/common/common.dart';
import 'package:login/login/login.dart';
import 'package:login/home/home.dart';
import 'package:login/splash/splash.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (BuildContext context) => 
        AuthenticationBloc(userRepository: userRepository)
          ..dispatch(AppStarted()),
      child: MyApp(userRepository: userRepository),
    )
  );
}


class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ), 
    );
  }
}