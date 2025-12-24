import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.title});

  final String title;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Quiz> quiz = quizData;
  int currentQuestionIndex = 0;

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < quiz.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void _prevQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiz = quiz[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1} of ${quiz.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(currentQuiz.question, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 32),
              Column(
                children: List.generate(
                  currentQuiz.options.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(currentQuiz.options[index]),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? _prevQuestion : null,
                    child: const Text('Prev'),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: currentQuestionIndex < quiz.length - 1
                        ? _nextQuestion
                        : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
