import 'package:flutter/material.dart';

void main() => runApp(new LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  String username;
  String password;

  void login() {
    var loginForm =loginKey.currentState;

    if(loginForm.validate()) {
      loginForm.save();
      print('username: $username + password: + $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form 表单示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form表单示例'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: ' 请输入用户名 ',
                      ),
                      onSaved: (value) => (username = value),
                      onFieldSubmitted: (value) {},
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: ' 请输入密码 ',
                      ),
                      obscureText: true,
                      validator: (value) {
                        return value.length < 6 ? ' 密码长度不够6位 ' : null;
                      },
                      onSaved: (value) => (password = value),
                    ),
                  ],
                ),
              ),
            ),
            new SizedBox(
              width: 340.0,
              height: 42.0,
              child: new RaisedButton(
                onPressed: login,
                child: new Text(
                  ' 登录 ',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}