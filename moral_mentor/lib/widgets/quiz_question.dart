import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizQuestion extends StatefulWidget {
  final Question question;
  final Function(bool) onSelected;
  final bool showExplanation;

  QuizQuestion({
    required this.question,
    required this.onSelected,
    required this.showExplanation,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant QuizQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      // Reset scroll position to the start
      _scrollController.jumpTo(0.0);
      // Reset selected option
      widget.question.selectedOption = null;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure only two options are displayed
    final options = widget.question.options.take(2).toList();

    return Container(
      // color: const Color(0xFF001120), // Set the background color here
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1), // Fixed border size
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 80.0, // Adjust this value to control the max height (3-4 lines)
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.question.text,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      if (!widget.showExplanation) {
                        setState(() {
                          widget.question.selectedOption = option; // Update the selected option
                        });
                        widget.onSelected(option == widget.question.correctOption);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: option == widget.question.selectedOption
                            ? Colors.purple.shade100
                            : Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5), // Fixed border size
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: SingleChildScrollView(
                        child: Text(option),
                      ),
                    ),
                  );
                }).toList(),
                if (widget.showExplanation) ...[
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.orange.shade200, // Light orange/yellow color
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Learnings from this decision:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 80.0, // Adjust this value to control the max height (3-4 lines)
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              widget.question.explanation, // Display the explanation text
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
