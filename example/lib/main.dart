import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_helloworld/flutter_plugin_helloworld.dart';

class AppState with ChangeNotifier {}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appState = AppState();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => appState),
      ],
      child: MaterialApp(home: LoginPage()),
    );
  }
}

/// LoginPage
///
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String _panelId;
  String _deviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마켓링크'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                autovalidate: _validate,
                child: loginFormWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginFormWidget() {
    final _panelField = TextFormField(
      decoration: const InputDecoration(labelText: '패널 ID'),
      obscureText: true,
      keyboardType: TextInputType.text,
      onSaved: (String val) {
        _panelId = val;
      },
    );

    final _deviceField = TextFormField(
      decoration: const InputDecoration(labelText: '기기 ID'),
      keyboardType: TextInputType.text,
      onSaved: (String val) {
        _deviceId = val;
      },
    );

    return Column(
      children: <Widget>[
        _panelField,
        _deviceField,
        SizedBox(height: 10.0),
        RaisedButton(onPressed: _submit, child: Text('로그인'))
      ],
    );
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();
      print("SUBMITTED");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DetailPage()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}

/// DetailPage
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.all_out),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage())),
          )
        ],
      ),
      body: Container(),
    );
  }
}
