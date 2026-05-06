import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/cubit/questions_cubit.dart';
import 'package:mind_mint/data/model/questions_model.dart';
import 'package:mind_mint/presentation/widgets/inswer_item.dart';
import 'package:mind_mint/presentation/widgets/question_item.dart';
import 'package:mind_mint/presentation/widgets/quiz_navigation_buttons.dart';
import 'package:mind_mint/presentation/widgets/show_submit_dialog.dart';

class QuizViewBody extends StatefulWidget {
  final List<QuestionModel> questions;
  const QuizViewBody({super.key, required this.questions});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentIndex];
    final cubit = context.watch<QuestionsCubit>();
    String? currentSelectedAnswer = cubit.userAnswers[currentIndex];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 16),
        child: Column(
          children: [
            QuestionItem(
              questionModel: currentQuestion,
              index: currentIndex,
              totalQuestions: widget.questions.length,
            ),
      
            const SizedBox(height: 24),
      
            ...List.generate(currentQuestion.allAnswers.length, (index) {
              String answerText = currentQuestion.allAnswers[index];
      
              return AnswerItem(
                label: String.fromCharCode(65 + index),
                answerText: answerText,
                isSelected: currentSelectedAnswer == answerText,
                onTap: () {
                  context.read<QuestionsCubit>().saveAnswer(
                    currentIndex,
                    answerText,
                  );
                  setState(() {});
                },
              );
            }),
      
            const SizedBox(height: 50),
      
            QuizNavigationButtons(
              currentIndex: currentIndex,
              totalQuestions: widget.questions.length,
              onPrev: () {
                setState(() {
                  currentIndex--;
                });
              },
              onNext: () {
                var cubit = context.read<QuestionsCubit>();
                if (currentIndex < widget.questions.length - 1) {
                  setState(() => currentIndex++);
                } else {
                  if (cubit.userAnswers.length < widget.questions.length) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please answer all questions before submitting!",
                        ),
                        backgroundColor: const Color(0xffE1A8AE),
                      ),
                    );
                  } else {
                    
                    showSubmitDialog(context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }



}
