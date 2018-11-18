import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Center(
           child: _raisedButton,
        ),
      ),
    );
  }
}


var _raisedButton = new RaisedButton(
  child: const Text('Simple button'),
  color: Colors.purple,
  elevation: 4.0,
  splashColor: Colors.blueGrey,
  onPressed: () {
    print("Button is tapped");

  },
);