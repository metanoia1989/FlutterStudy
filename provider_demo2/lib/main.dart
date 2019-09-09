import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo2/state/counter.dart';
import 'package:provider_demo2/state/user.dart';
import 'first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>.value(value: Counter()),
        ChangeNotifierProvider<User>.value(value: User()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage(),
      ),
    );
  }
}
