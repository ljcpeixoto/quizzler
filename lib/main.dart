import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'This is where the question will go.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        textButton('True', Colors.green, truePressed),
        textButton('False', Colors.red, falsePressed),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  void truePressed() {
    setState(() {
      scoreKeeper.add(correctIcon);
    });
  }

  void falsePressed() {
    setState(() {
      scoreKeeper.add(wrongIcon);
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
