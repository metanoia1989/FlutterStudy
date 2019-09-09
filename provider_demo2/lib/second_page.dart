import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo2/state/counter.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')), 
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                counter.increment();
              },
            ),
            Builder(
              builder: (context) {
                print('second page counter widget rebuild');
                return Text(
                  'second page: ${counter.count}'
                );
              },
            ),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                counter.decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}