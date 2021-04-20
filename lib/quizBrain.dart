import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;

  List<Question> _questionBank = [
    Question(q: 'Aryabhatta innvented the letter ZERO?', a: true),
    Question(q: 'There are 50 Cards in a playing Deck.', a: false),
    Question(q: 'Shakuntala Devi known as Human Computer.', a: true),
    Question(q: 'White color symbolizes Peace.', a: true),
    Question(q: 'Shape of the Brick is Square.', a: false),
    Question(q: 'Dog is the first animal to go to Space.', a: true),
    Question(
        q: 'Venus is not known as the Morning Star or the Evening Star.',
        a: false),
    Question(q: 'Edward Jenner is  the father of Vaccination.', a: true),
    Question(q: 'Sound travels faster the Light.', a: false),
    Question(q: 'Olympics held after every 5 years.', a: false),
    Question(q: 'Olympics held after every 5 years.', a: false),
  ];

  void nextQuestion() {
    if (_questionIndex < _questionBank.length) _questionIndex++;
  }

  String getQuestion() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  bool gameOver() {
    if (_questionIndex == _questionBank.length - 1)
      return true;
    else
      return false;
  }

  void resetGame() {
    _questionIndex = 0;
  }
}
