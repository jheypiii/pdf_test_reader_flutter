import 'package:flutter/material.dart';
import 'pdf_parser.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;

  const ResultScreen({super.key, required this.questions});

  int get correctAnswers {
    return questions.where((q) => q.userAnswer == q.correctAnswer).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você acertou $correctAnswers de ${questions.length}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}