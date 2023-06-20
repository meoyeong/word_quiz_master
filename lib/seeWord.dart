import 'package:flutter/material.dart';
import 'selectChapter.dart';

class seeWord extends StatelessWidget {

  // This widget is the root of your application.
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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center
          (
          child:Column(mainAxisAlignment: MainAxisAlignment.center, children:
          [
            Text(
                "토익 단어장 보기",
                style: TextStyle(fontSize: 35, color:Colors.purple)),
            SizedBox(height: 60.0),
            ElevatedButton
              (
              onPressed: ()
              { Navigator.push
                (
                  context,
                  MaterialPageRoute
                    (
                      builder: (_) => selectChapter()
                  )
              );
              },
              child: Text
                (
                  "챕터 선택",
                  style: TextStyle(fontSize: 35, color:Colors.purple)
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                  minimumSize: Size(300, 100),   // 버튼의 크기 조절하는 속성
                  disabledForegroundColor : Colors.lightGreen // 비활성화된 버튼 색도 바꿀 수 있다.
              ),
            ),
            SizedBox(height: 60.0),
            SizedBox(height: 60.0),
            ElevatedButton
              (
              onPressed: ()
              {
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

              child: Text
                (
                  "전에 보던 챕터"
                  ,
                  style: TextStyle(fontSize: 35, color:Colors.purple)
              ),
              style: TextButton.styleFrom
                (
                  foregroundColor: Colors.purple,
                  minimumSize: Size(300, 100),   // 버튼의 크기 조절하는 속성
                  disabledForegroundColor : Colors.lightGreen // 비활성화된 버튼 색도 바꿀 수 있다.
              ),
            ),
          ]
          ),

        )
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