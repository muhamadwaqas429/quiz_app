import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answertext;
  final void Function() onTab;
  const AnswerButton({super.key, required this.answertext, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
          ),
          onPressed: onTab,
          child: Text(answertext,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
