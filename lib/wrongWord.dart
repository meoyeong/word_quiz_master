import 'package:flutter/material.dart';

class wrongWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("오답 확인 탭"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "오답 확인 내용:",
              style: TextStyle(fontSize: 20,color:Colors.purple),
            ),
            SizedBox(height: 20),
            Text(
              "단어: Apple",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
            SizedBox(height: 10),
            Text(
              "뜻: 사과",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
            SizedBox(height: 20),
            Text(
              "단어: Banana",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
            SizedBox(height: 10),
            Text(
              "뜻: 바나나",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
            SizedBox(height: 20),
            Text(
              "단어: Carrot",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
            SizedBox(height: 10),
            Text(
              "뜻: 당근",
              style: TextStyle(fontSize: 18,color:Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}