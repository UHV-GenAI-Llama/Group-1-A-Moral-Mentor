import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class QuizResult extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResult({Key? key, required this.score, required this.totalQuestions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;

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
            SizedBox(
              width: 200,
              height: 200,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percentage),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              color: Colors.blue,
                              value: value,
                              title: '${value.toStringAsFixed(1)}%',
                              radius: 80,
                              titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            PieChartSectionData(
                              color: Colors.grey[300],
                              value: 100 - value,
                              radius: 80,
                              title: '',
                            ),
                          ],
                          centerSpaceRadius: 50,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${score}/${totalQuestions}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 50), // Increased spacing between pie chart and button
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
