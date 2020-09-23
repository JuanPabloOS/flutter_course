import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _changingText = 'You can change this';
  bool _changed = false;
  void _changeText() {
    setState(() {
      if (_changed) {
        _changingText = "Change it again!!";
      } else {
        _changingText = "You did it!!";
      }
      _changed = !_changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Changing text'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CustomedText(_changingText),
              TextControl(_changeText)
            ],
          ),
        ),
      ),
    );
  }
}

class TextControl extends StatelessWidget {
  final Function changeText;

  TextControl(this.changeText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Change it'),
        onPressed: changeText,
      ),
    );
  }
}

class CustomedText extends StatelessWidget {
  final String text;

  CustomedText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.blueGrey, fontSize: 25),
        ),
      ),
    );
  }
}
