import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizResult extends StatelessWidget {
  final int score;

  const QuizResult({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score: $score', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/home');
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
