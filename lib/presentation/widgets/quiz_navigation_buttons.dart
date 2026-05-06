import 'package:flutter/material.dart';

class QuizNavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const QuizNavigationButtons({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    bool isLastQuestion = currentIndex == totalQuestions - 1;
    bool isFirstQuestion = currentIndex == 0;

    return Row(
     
      mainAxisAlignment: isFirstQuestion 
          ? MainAxisAlignment.end 
          : MainAxisAlignment.spaceBetween,
      children: [
       
        if (!isFirstQuestion)
          OutlinedButton(
            onPressed: onPrev,
            style: OutlinedButton.styleFrom(
               backgroundColor: const Color(0xff6D5458), 
              side: const BorderSide(color: Color(0xffE4B5B9)),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text("Prev",style: TextStyle(color: Colors.white) ),
          ),

        
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff6D5458), 
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(isLastQuestion ? "Submit" : "Next "),
              const SizedBox(width: 8),
             
            ],
          ),
        ),
      ],
    );
  }
}