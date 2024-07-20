import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'quiz_page.dart';
import 'package:moral_mentor/widgets/appdrawer.dart';
import 'package:moral_mentor/widgets/appbar.dart';

class ScenariosPage extends StatelessWidget {
  final List<String> themes = [
    'Loyalty', 'Honesty', 'Cheating', 'Personal Values', 'Alcoholism',
    'Misconduct', 'Fairness', 'Responsibility', 'Friendship', 'Plagiarism',
    'Truthfulness', 'Disappointment', 'Appropriate Touch', 'The Impact of Words',
    'Keeping Children Out of Adult Issues', 'Setting Boundaries', 'Bullying',
    'Making Choices', 'Challenging Authority', 'Expectations from Parents and Society',
    'Integrity', 'Equality', 'Relationships', 'Forgiveness and Rumors', 'The Value of Honesty'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveAppBar(
        userName: 'John Doe',
        profilePicUrl: 'https://example.com/profile_pic.png',
      ),
      drawer: const AppDrawer(
        userName: 'John Doe',
        profilePicUrl: 'https://example.com/profile_pic.png',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3, // Adjust the aspect ratio as needed
          ),
          itemCount: themes.length,
          itemBuilder: (context, index) {
            return Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage(theme: themes[index])),
                  );
                },
                child: Text(
                  themes[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
