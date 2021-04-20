import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

QuizBrain quizBrainMain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzlerBody(),
          ),
        ),
      ),
    );
  }
}

class QuizzlerBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<QuizzlerBody> {
  List<Icon> scoreKeeper = [];
  int alertCounter = 0;

  void checkAnswer(bool pickedAns, bool correctAns) {
    setState(() {
      if (quizBrainMain.gameOver() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Completed",
          desc: "You\'ve successfully completed the Quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 90,
            )
          ],
        ).show();

        quizBrainMain.resetGame();
        scoreKeeper = [];
      } else {
        if (pickedAns == correctAns)
          answerCorrect();
        else
          answerIncorrect();

        quizBrainMain.nextQuestion();
      }
    });
  }

  void answerCorrect() {
    scoreKeeper.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void answerIncorrect() {
    scoreKeeper.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        quizBrainMain.getQuestion(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(20.0),
                            color: Colors.green[300],
                            child: TextButton(
                              child: Text(
                                'True',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              onPressed: () {
                                checkAnswer(true, quizBrainMain.getAnswer());
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            color: Colors.red[300],
                            child: TextButton(
                              child: Text(
                                'False',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              onPressed: () {
                                checkAnswer(false, quizBrainMain.getAnswer());
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(children: scoreKeeper),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
