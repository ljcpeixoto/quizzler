import 'package:flutter/material.dart';

import 'question.dart';

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

  int questionNumber = 0;
  List<Question> questions = [
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
  List<Icon> scoreKeeper = [];

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
                questions[questionNumber].question,
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
    setState(() {
      if (questionNumber < questions.length - 1) {
        if (questions[questionNumber].answer) {
          scoreKeeper.add(correctIcon);
        } else {
          scoreKeeper.add(wrongIcon);
        }
        questionNumber++;
      }
    });
  }

  void falsePressed() {
    setState(() {
      if (questionNumber < questions.length - 1) {
        if (questions[questionNumber].answer) {
          scoreKeeper.add(wrongIcon);
        } else {
          scoreKeeper.add(correctIcon);
        }
        questionNumber++;
      }
    });
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
