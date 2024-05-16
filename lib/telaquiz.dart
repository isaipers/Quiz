import 'package:flutter/material.dart';
import 'teladestino.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;

  final List<Pergunta> _perguntas = [
   Pergunta(
    pergunta: 'Qual o nome do movimento de quebra de guarda?',
    respostas: ['Dragon rush', 'Dragon breath', 'Rush Dragon', 'Cross Up'],
    respostaCorreta: 'Dragon rush',
   ),
   Pergunta(
    pergunta: 'Qual o combo mais recomendado a se aprender?',
    respostas: ['Combo com começo de golpe fraco', 'Combo com começo de golpe médio', 'Combo com começo de golpe forte', 'Combo com começo de super dash'],
    respostaCorreta: 'Combo com começo de golpe médio',
   ),
    Pergunta(
    pergunta: 'Qual personagem tem um ataque especial que possui hitkill?',
    respostas: ['Androide 17', 'Goku ssj', 'Gogeta ssb', 'Gogeta ssj4'],
    respostaCorreta: 'Gogeta ssj4',
   ),
   Pergunta(
    pergunta: 'Qual a assistência mais chata do jogo?',
    respostas: ['Assistência A', 'Assistência B', 'Assistência C', 'Todas elas'],
    respostaCorreta: 'Assistência C',
   ),
  ];

  void _responderPergunta(String resposta) {
    if (_perguntas[_perguntaAtual].respostaCorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }

    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaDestino(_pontuacao, _perguntas.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _perguntas[_perguntaAtual].pergunta,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ...(_perguntas[_perguntaAtual].respostas).map((resposta) {
              return ElevatedButton(
                onPressed: () {
                  _responderPergunta(resposta);
                },
                child: Text(resposta),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Pergunta {
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
  });
}