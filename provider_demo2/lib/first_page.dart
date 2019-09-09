import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo2/second_page.dart';
import 'package:provider_demo2/state/counter.dart';
import 'package:provider_demo2/state/user.dart';

class FirstPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(title: Text('FirstPage')), 
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                counter.increment();
              },
            ),
            Text('${counter.count}'),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                counter.decrement();
              },
            ),
            Text('${user.name}'),
            TextField(
              controller: controller,
            ),
            RaisedButton(
              child: Text('change name'),
              onPressed: () {
                user.setName(controller.text);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.group_work),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return SecondPage();
            }
          ));
        },
      ),
    );
  }
}