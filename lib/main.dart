import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/result.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:first_app/home.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  // under score means it is a private class. it is actual syntax in dart :/
  // similarly, under score starting variables mean they are private properties
  var _questionIndex = 0;
  var _totalScore = 0;
  var currentIndex = 0;
  static const _questions = [
    {
      "questionText": "What was your first gaming platform?",
      "answers": [
        {"text": "Wii/Wii U", "score": 2013},
        {"text": "Mac", "score": 2012},
        {"text": "Xbox 360", "score": 2010},
        {"text": "Xbox One", "score": 2014},
        {"text": "PlayStation 3", "score": 2008},
        {"text": "Game Boy", "score": 1989}
      ]
    },
    {
      "questionText": "What TV show sounds familiar to you?",
      "answers": [
        {"text": "Adventure time", "score": 2014},
        {"text": "Avatar: TLA", "score": 2006},
        {"text": "The Looney Toons", "score": 2011},
        {"text": "Star Wars: The Clone Wars", "score": 2008}
      ],
    },
    {
      "questionText": "Have you even been to a Chicken Pox Party?",
      "answers": [
        {"text": "Yes", "score": 1992},
        {"text": "No", "score": 1998},
        {"text": "What", "score": 2006},
      ]
    },
    {
      "questionText": "What would you do if you won the lottery?",
      "answers": [
        {"text": "Buy a house", "score": 2000},
        {"text": "Add it to savings", "score": 1990},
        {"text": "Party", "score": 2004},
        {"text": "Not tell a single soul", "score": 1989}
      ]
    },
    {
      "questionText": "Do you have a plan for the future?",
      "answers": [
        {"text": "Mostly planned", "score": 1990},
        {"text": "Fully planned", "score": 1985},
        {"text": "Planning is useless", "score": 2008},
        {"text": "I've thought about it", "score": 2005}
      ]
    },
  ];
  void answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });

    _totalScore += score;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List listOfColours = [
      Home(),
      Container(color: Colors.deepOrange),
      Container(color: Colors.blue),
      Quiz(
        answerQuestion: answerQuestion,
        questions: _questions,
        questionIndex: _questionIndex,
      )
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.blue])),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        )),
                    ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Preferences"),
                        onTap: () {}),
                    ListTile(
                        leading: Icon((Icons.bug_report_sharp)),
                        title: Text("Report a bug"),
                        onTap: () {})
                  ],
                )),
                appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        title: "Quiz App".text.xl4.white.bold.make().shimmer(
                            primaryColor: Colors.blue,
                            secondaryColor: Colors.white),
                        elevation: 0,
                        centerTitle: true),
                body: _questionIndex < _questions.length
                    ? listOfColours[currentIndex]
                    // ? == an "if" statement to run the Quiz widget.
                    : Center(
                        // The center widget is the "else block"
                        //to the "?" conditional test we did earlier
                        child: Result(_totalScore, _resetQuiz),
                      ),
                bottomNavigationBar: BottomNavyBar(
                    selectedIndex: currentIndex,
                    backgroundColor: null,
                    items: <BottomNavyBarItem>[
                      BottomNavyBarItem(
                          title: Text("Home"),
                          icon: Icon(Icons.home),
                          activeColor: Colors.green,
                          inactiveColor: Colors.blue),
                      BottomNavyBarItem(
                          title: Text("Create"),
                          icon: Icon(Icons.add_outlined),
                          activeColor: Colors.green,
                          inactiveColor: Colors.blue),
                      BottomNavyBarItem(
                        title: Text("Search"),
                        icon: Icon(Icons.search),
                        activeColor: Colors.green,
                        inactiveColor: Colors.blue,
                      ),
                      BottomNavyBarItem(
                          title: Text("Settings"),
                          icon: Icon(Icons.settings),
                          activeColor: Colors.green,
                          inactiveColor: Colors.blue),
                    ],
                    onItemSelected: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    }))));
  }
}
