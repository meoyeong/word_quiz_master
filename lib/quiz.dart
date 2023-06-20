import 'package:flutter/material.dart';

class quiz extends StatelessWidget {
  // List of quiz questions and answers
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'run',
      'choices': ['자다', '뛰다', '엎다', '기어가다'],
      'answer': 1, // Index of the correct answer
    },
    {
      'question': 'play',
      'choices': ['자다', '지다', '이기다', '놀다'],
      'answer': 3, // Index of the correct answer
    },
    {
      'question': 'play',
      'choices': ['자다', '지다', '이기다', '놀다'],
      'answer': 3, // Index of the correct answer
    },
    {
      'question': 'play',
      'choices': ['자다', '지다', '이기다', '놀다'],
      'answer': 3, // Index of the correct answer
    },
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '영어 단어장 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: '영어 단어장 메인', questions: questions),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> questions;

  const MyHomePage({required this.title, required this.questions});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentQuestionIndex = 0;
  List<int> userAnswers = [];

  void selectAnswer(int index) {
    setState(() {
      userAnswers.add(index);
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
        userAnswers.add(-1); // Reset the user's answer for the next question
      }
    });
  }

  int? getCorrectAnswer() {
    if (currentQuestionIndex < widget.questions.length) {
      final currentQuestion = widget.questions[currentQuestionIndex];
      return currentQuestion['answer'];
    }
    return null;
  }

  bool isAnswered() {
    return currentQuestionIndex < userAnswers.length && userAnswers[currentQuestionIndex] != -1;
  }

  String getResultMessage() {
    final correctAnswerIndex = getCorrectAnswer();
    final userAnswerIndex = userAnswers[currentQuestionIndex];
    if (correctAnswerIndex != null && userAnswerIndex == correctAnswerIndex) {
      return '정답입니다!';
    } else {
      return '오답입니다!';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      // Display quiz result or end screen
      return Scaffold(
        body: Center(
          child: Text(
            '퀴즈가 종료되었습니다!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }

    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '퀴즈 풀기',
              style: TextStyle(fontSize: 35, color: Colors.purple),
            ),
            SizedBox(height: 60.0),
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 20, color:Colors.purple),
            ),
            SizedBox(height: 20.0),
            Column(
              children: List<Widget>.generate(
                currentQuestion['choices'].length,
                    (index) {
                  return ElevatedButton(
                    onPressed: isAnswered() ? null : () => selectAnswer(index),
                    child: Text(
                      currentQuestion['choices'][index],
                      style: TextStyle(fontSize: 20, color:Colors.purple),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: isAnswered()
                          ? index == getCorrectAnswer()
                          ? Colors.green // Correct answer
                          : Colors.red // Incorrect answer
                          : Colors.blueGrey, // Default button color
                      minimumSize: Size(300, 50),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            if (isAnswered())
              Text(
                getResultMessage(),
                style: TextStyle(fontSize: 20, color:Colors.purple),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: isAnswered() ? nextQuestion : null,
              child: Text(
                '다음 문제',
                style: TextStyle(fontSize: 20, color:Colors.purple),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                minimumSize: Size(300, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}