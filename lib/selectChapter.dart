import 'package:flutter/material.dart';

class selectChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '영어 단어장 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '영어 단어장 메인'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "챕터 선택",
              style: TextStyle(fontSize: 35, color: Colors.purple),
            ),
            SizedBox(height: 60.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WordListPage(
                      category: '명사',
                      wordList: [
                        Word(
                          word: 'apple',
                          meaning: '사과',
                          form: 'noun',
                          wrongCount: 0,
                        ),
                        Word(
                          word: 'car',
                          meaning: '자동차',
                          form: 'noun',
                          wrongCount: 0,
                        ),
                        // Add more words here
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                "명사",
                style: TextStyle(fontSize: 35, color: Colors.purple),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
                minimumSize: Size(300, 100),
                disabledForegroundColor: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WordListPage(
                      category: '동사',
                      wordList: [
                        Word(
                          word: 'run',
                          meaning: '달리다',
                          form: 'verb',
                          wrongCount: 0,
                        ),
                        Word(
                          word: 'eat',
                          meaning: '먹다',
                          form: 'verb',
                          wrongCount: 0,
                        ),
                        // Add more words here
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                "동사",
                style: TextStyle(fontSize: 35, color: Colors.purple),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
                minimumSize: Size(300, 100),
                disabledForegroundColor: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WordListPage(
                      category: '형용사',
                      wordList: [
                        Word(
                          word: 'happy',
                          meaning: '행복한',
                          form: 'adjective',
                          wrongCount: 0,
                        ),
                        Word(
                          word: 'big',
                          meaning: '큰',
                          form: 'adjective',
                          wrongCount: 0,
                        ),
                        // Add more words here
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                "형용사",
                style: TextStyle(fontSize: 35, color: Colors.purple),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
                minimumSize: Size(300, 100),
                disabledForegroundColor: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WordListPage(
                      category: '부사',
                      wordList: [
                        Word(
                          word: 'quickly',
                          meaning: '빨리',
                          form: 'adverb',
                          wrongCount: 0,
                        ),
                        Word(
                          word: 'slowly',
                          meaning: '천천히',
                          form: 'adverb',
                          wrongCount: 0,
                        ),
                        // Add more words here
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                "부사",
                style: TextStyle(fontSize: 35, color: Colors.purple),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
                minimumSize: Size(300, 100),
                disabledForegroundColor: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WordListPage extends StatefulWidget {
  final String category;
  final List<Word> wordList;

  const WordListPage({
    required this.category,
    required this.wordList,
  });

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('단어 목록'),
      ),
      body: ListView.builder(
        itemCount: widget.wordList.length,
        itemBuilder: (context, index) {
          var word = widget.wordList[index].word;
          var meaning = widget.wordList[index].meaning;
          var form = widget.wordList[index].form;
          var wrongCount = widget.wordList[index].wrongCount;
          return ListTile(
            title: Text(
              word,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meaning,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '형태: $form',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '틀린 횟수: $wrongCount',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Word {
  final String word;
  final String meaning;
  final String form;
  final int wrongCount;

  Word({
    required this.word,
    required this.meaning,
    required this.form,
    required this.wrongCount,
  });
}