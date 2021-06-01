import 'package:first_app/buttons.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    int numOfQuestions = 5;
    double avg = resultScore / numOfQuestions;
    String resultPhrase = "${avg.toInt()}";

    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
        Center(
          child:Text("Estimated year of birth", style: TextStyle(color: Colors.white, fontSize: 14)))
      ,
      Text(
        "$resultPhrase",
        style: TextStyle(
            color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      GradientButton(resetQuiz, "Restart Quiz!")
    ]));
  }
}
