import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_bg.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  void choseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == Questions.length) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              chosenAnswer: selectedAnswers,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBg(
            color1: Colors.purpleAccent,
            color2: Colors.purple,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/quiz-logo.png', // Replace with your logo's path
                  width: 200,
                  color: const Color.fromARGB(150, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Learn Flutter the Fun way!',
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        onSelectAnswer: choseAnswer,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_right_alt, size: 24),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  side: const BorderSide(color: Colors.white70),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                label: const Text("Start Quiz"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
