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

  @override
  void initState() {
    super.initState();
    resetQuiz();
  }

  @override
  void dispose() {
    resetQuizWithoutUI();
    super.dispose();
  }

  void resetQuiz() {
    resetQuizWithoutUI();
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _showExplanation = false;
    });
  }

  void resetQuizWithoutUI() {
    for (var question in questions) {
      question.selectedOption = null;
    }
  }

  void _nextQuestion() {
    setState(() {
      _showExplanation = false;
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResult(score: _score, totalQuestions: questions.length),
          ),
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
        title: Text('Quiz on ${widget.theme}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _quitQuiz,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Increased padding for more space
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the ${widget.theme} Quiz!',
              style: const TextStyle(
                fontSize: 24.0, // Increased font size for the title
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0), // Added space between elements
            const Text(
              'What will you do in this Scenario: ',
              style: TextStyle(
                fontSize: 18.0, // Increased font size for the subtitle
              ),
            ),
            const SizedBox(height: 30.0), // Added space between elements
            Card(
              elevation: 0.0, // Removed border by setting elevation to 0
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding inside each question card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${_currentQuestionIndex + 1}',
                      style: const TextStyle(
                        fontSize: 20.0, // Increased font size for question titles
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0), // Space between question title and content
                    QuizQuestion(
                      question: question,
                      onSelected: (isCorrect) {
                        setState(() {
                          _showExplanation = true;
                          if (isCorrect) _score++;
                        });
                      },
                      showExplanation: _showExplanation,
                    ),
                    if (_showExplanation) ...[
                      const SizedBox(height: 20.0), // Space before button
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade100, // Light purple color
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Increased padding
                          textStyle: const TextStyle(fontSize: 18.0), // Increased font size
                        ),
                        child: Text(_currentQuestionIndex < questions.length - 1 ? 'Next' : 'Submit'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
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
