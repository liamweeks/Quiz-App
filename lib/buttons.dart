import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  //final String gradientButtonText;
  final Function answerQuestion;
  final String answerText;
  var questionIndex = 0;
  GradientButton(this.answerQuestion, this.answerText);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(10),
      // ignore: deprecated_member_use
      child: RaisedButton(
        // ignore: unnecessary_statements
        onPressed: () {answerQuestion();},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 250.0, maxHeight: 50.0),
            alignment: Alignment.center,
            child: Text(answerText,   //$gradientButtonText
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),),
        ),
        ),
      )
    );
  }
}

