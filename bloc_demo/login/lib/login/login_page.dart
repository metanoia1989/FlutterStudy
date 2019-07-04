import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login/res/user_repository.dart';
import 'package:login/bloc/login/login.dart';
import 'package:login/bloc/authentication/authentication.dart';
import 'package:login/login/login.dart';


class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
    : assert(userRepository != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ), 
      body: BlocProvider(
        builder: (BuildContext context) => LoginBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          userRepository: userRepository,
        ),
        child: LoginForm(),
      ),
    );
  }
}