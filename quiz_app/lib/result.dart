import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';
    if(resultScore<=8){
      resultText = 'You are awesome an innocent!';
    }else if(resultScore<= 12){
      resultText = 'Pretty likeable!';
    }else{
      resultText = ':(';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(child: Text('Restart quiz'), onPressed: resetQuiz,),
        ],
      ),
    );
  }
}
