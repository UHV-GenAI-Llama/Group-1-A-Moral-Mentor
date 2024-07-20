import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moral_mentor/models/question.dart';
import 'package:moral_mentor/data/questions.dart'; // Import the questions from the data file
import 'package:moral_mentor/widgets/quiz_question.dart';
import 'package:moral_mentor/widgets/quiz_result.dart';

class QuizPage extends StatefulWidget {
  final String theme;

  const QuizPage({Key? key, required this.theme}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showExplanation = false;
  bool _isCorrect = false;

  void _nextQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) _score++;
      _showExplanation = true;
      _isCorrect = isCorrect;
    });
  }

  void _continue() {
    setState(() {
      _showExplanation = false;
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizResult(score: _score)),
        );
      }
    });
  }

  void _quitQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quit Quiz'),
        content: const Text('Are you sure you want to quit the quiz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              context.go('/home');
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= questions.length) {
      return _buildResult();
    }

    final question = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.theme),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _quitQuiz,
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuizQuestion(
                question: question,
                onSelected: _nextQuestion,
                showExplanation: _showExplanation,
                isCorrect: _isCorrect,
              ),
              if (_showExplanation)
                ElevatedButton(
                  onPressed: _continue,
                  child: Text(_currentQuestionIndex < questions.length - 1 ? 'Next' : 'Submit'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $_score/${questions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
