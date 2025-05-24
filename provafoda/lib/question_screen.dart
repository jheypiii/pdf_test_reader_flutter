import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pdf_parser.dart';
import 'result_screen.dart';

final questionsProvider = FutureProvider<List<Question>>((ref) async {
  return await PDFParser.parsePDF('caminho/do/seu/arquivo.pdf');
});

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsync = ref.watch(questionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: questionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (questions) => ListView.builder(
          itemCount: questions.length,
          itemBuilder: (ctx, index) {
            final question = questions[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question.text, style: const TextStyle(fontSize: 18)),
                    ...question.options.asMap().entries.map((option) {
                      return RadioListTile<int>(
                        title: Text(option.value),
                        value: option.key,
                        groupValue: question.userAnswer,
                        onChanged: (value) {
                          question.userAnswer = value;
                        },
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final questions = questionsAsync.value;
          if (questions != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ResultScreen(questions: questions),
              ),
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}