import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_bg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;  // This function gets the selected answer

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);  // Use widget to access the function
    setState(() {
      if (currentIndex < Questions.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;  // Restart after the last question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = Questions[currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          GradientBg(
            color1: Colors.purpleAccent,
            color2: Colors.purple,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Answer buttons using your custom AnswerButton
                ...currentQuestion.getSuffledAnswers().map((item) {
                  return AnswerButton(
                    answertext: item,
                    onTab: () {
                      answerQuestion(item);  // Pass the selected answer
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
