import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Icon correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon wrongIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.getQuestionAnswer() == userPickedAnswer) {
        scoreKeeper.add(correctIcon);
      } else {
        scoreKeeper.add(wrongIcon);
      }
      quizBrain.nextQuestion();
      if (quizBrain.finished()) {
        int pontos =
            scoreKeeper.where((element) => element == correctIcon).length;
        int total = scoreKeeper.length;
        Alert(
          context: context,
          title: "Fim de Jogo",
          desc: "O jogo acabou. Você fez $pontos de $total.",
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  scoreKeeper.clear();
                  quizBrain.resetQuestionNumber();
                  Navigator.pop(context);
                });
              },
              width: 120,
              child: const Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        textButton('Verdadeiro', Colors.green, truePressed),
        textButton('Falso', Colors.red, falsePressed),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  void truePressed() {
    checkAnswer(true);
  }

  void falsePressed() {
    checkAnswer(false);
  }

  textButton(
    String texto,
    MaterialColor cor,
    void Function() onPressed,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: cor,
          ),
          onPressed: onPressed,
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
