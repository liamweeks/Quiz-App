import 'package:flutter/material.dart';
import 'package:first_app/buttons.dart';
import 'package:first_app/question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  Quiz({
    @required this.answerQuestion,
    @required this.questions,
    @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]["questionText"]),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>).map((answer) {
          return GradientButton( () => answerQuestion(answer["score"]), answer["text"]);
        }).toList()
        // What does "..." mean? it takes all of the items from the nested list (the one making the answer buttons)
        // and put them into the outer (children) list as individual values
        // Having only one list with the values of the nested one

        /*  ElevatedButton(
                        child: Text("Answer B"),
                        onPressed: () {
                          answerQuestion();
                        },),
                      ElevatedButton(
                        child: Text("Answer C"),
                        onPressed: () {
                          answerQuestion();
                        },),*/
      ],
    );
  }
}
