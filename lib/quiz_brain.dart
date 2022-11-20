import 'Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questions = [
    Question(
      question: "Um quilo de aço pesa mais do que um quilo de algodão.",
      answer: false,
    ),
    Question(
      question: "Os morcegos são os únicos mamíferos capazes de voar.",
      answer: true,
    ),
    Question(
      question: "A aranha é um inseto.",
      answer: false,
    ),
    Question(
      question: "Feliz é o sinônimo de alegre.",
      answer: true,
    ),
    Question(
      question:
          "Quando o simbolo ''vezes'' aparece em um broblema matemático você deve somar.",
      answer: false,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].answer;
  }

  bool finished() {
    return _questionNumber == _questions.length - 1;
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }
}
