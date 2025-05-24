import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFParser {
  static Future<List<Question>> parsePDF(String path) async {
    final pdf = pw.Document();
    final questions = <Question>[];

    // Simulando perguntas (substitua pela lógica real do seu PDF)
    questions.add(Question(
      text: "1. Qual é a capital do Brasil?",
      options: ["a) Rio de Janeiro", "b) São Paulo", "c) Brasília", "d) Salvador"],
      correctAnswer: 2,
    ));

    questions.add(Question(
      text: "2. Flutter é desenvolvido por:",
      options: ["a) Google", "b) Facebook", "c) Microsoft", "d) Apple"],
      correctAnswer: 0,
    ));

    return questions;
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;
  int? userAnswer;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
    this.userAnswer,
  });
}