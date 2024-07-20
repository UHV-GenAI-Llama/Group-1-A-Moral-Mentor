import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizQuestion extends StatelessWidget {
  final Question question;
  final Function(bool) onSelected;
  final bool showExplanation;
  final bool isCorrect;

  QuizQuestion({
    required this.question,
    required this.onSelected,
    required this.showExplanation,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...question.options.map((option) {
            return GestureDetector(
              onTap: () {
                if (!showExplanation) {
                  question.selectedOption = option; // Update the selected option
                  onSelected(option == question.correctOption);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: showExplanation
                      ? (option == question.correctOption
                      ? Colors.green
                      : (option == question.selectedOption
                      ? Colors.red
                      : Colors.white))
                      : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(option),
              ),
            );
          }).toList(),
          if (showExplanation)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                isCorrect ? 'Correct!' : 'Wrong!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
              ),
            ),
          if (showExplanation)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                question.explanation,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
