import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Comecar o Quizz', style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Pressione'))
            ],
        ),
    ),
  );
  }
}