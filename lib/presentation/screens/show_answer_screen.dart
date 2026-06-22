import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mind_mint/business_logic/questions_cubit/questions_cubit.dart';
import 'package:mind_mint/constants.dart';

import 'package:mind_mint/presentation/widgets/inswer_item.dart';
import 'package:mind_mint/presentation/widgets/question_item.dart';
import 'package:mind_mint/presentation/widgets/result_button.dart';

class ShowAnswerScreen extends StatelessWidget {
  const ShowAnswerScreen({
    super.key,
    
  });
  
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<QuestionsCubit>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Review Answers"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cubit.questions.length,
        itemBuilder: (context, qIndex) {
           final question = cubit.questions[qIndex];
           final userAnswer = cubit.userAnswers[qIndex];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionItem(
                      questionModel: question,
                      index: qIndex,
                      totalQuestions: cubit.questions.length,
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(question.allAnswers.length, (aIndex) {
                      final answer = question.allAnswers[aIndex];

                      
                      
                      return AnswerItem(
                        label: String.fromCharCode(65 + qIndex),
                        answerText: answer,
                        isSelected: false, 
                        onTap: () {},
                        showResult: true, 
                        isCorrect:
                            answer ==
                            question.correctAnswer, 
                        isWrong:
                            (answer == userAnswer) &&
                            (answer !=
                                question
                                    .correctAnswer), 
                      );
                    }),
                    const Divider(height: 40),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ResultButton(
              text: "Done",
              isGradient: true,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                homeScreen,
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
