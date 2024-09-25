import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_bg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;

  // Method to generate summary data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': Questions[i].text,
        'correct_answer': Questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  const ResultScreen({super.key, required this.chosenAnswer});

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final noTotalQuestions = Questions.length;
    final noCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      body: Stack(
        children: [
          const GradientBg(
            color1: Colors.deepPurple,
            color2: Colors.deepPurpleAccent,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40), // Padding on both left and right
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  // First Text: X out of Y are correct
                  Text(
                    "Your $noCorrectAnswer out of $noTotalQuestions are correct",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30), // Spacing between texts

                  // Questions summary
                  QuestionsSummary(summaryData: summaryData),

                  const SizedBox(height: 50), // Spacing before the button

                  // Button: Refresh
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Quiz(), // Navigate to the quiz screen
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Refresh",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
