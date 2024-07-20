class Question {
  final String text;
  final List<String> options;
  final String correctOption;
  String? selectedOption; // Add this property to track the selected option
  final String explanation;

  Question({
    required this.text,
    required this.options,
    required this.correctOption,
    this.selectedOption, // Initialize it as null
    required this.explanation,
  });
}
