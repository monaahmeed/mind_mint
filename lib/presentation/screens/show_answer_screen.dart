import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/cubit/questions_cubit.dart';
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

                      
                      // Color bg = const Color(0xffF2EAF9);
                      // Color border = Colors.transparent;
                      // IconData? icon;

                      // if (answer == question.correctAnswer) {
                      //   bg = Colors.green.shade50;
                      //   border = Colors.green;
                      //   icon = Icons.check_circle;
                      // } else if (answer == userAnswer &&
                      //     answer != question.correctAnswer) {
                      //   bg = Colors.red.shade50;
                      //   border = Colors.red;
                      //   icon = Icons.cancel;
                      // }

                      return AnswerItem(
                        label: String.fromCharCode(65 + qIndex),
                        answerText: answer,
                        isSelected: false, // ملوش لازمة هنا
                        onTap: () {},
                        showResult: true, // فعلنا وضع النتيجة
                        isCorrect:
                            answer ==
                            question.correctAnswer, // لو دي الإجابة الصح
                        isWrong:
                            (answer == userAnswer) &&
                            (answer !=
                                question
                                    .correctAnswer), // لو المستخدم اختارها وهي غلط
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
