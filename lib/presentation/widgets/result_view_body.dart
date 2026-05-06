import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/cubit/questions_cubit.dart';
import 'package:mind_mint/constants.dart';

import 'package:mind_mint/presentation/widgets/result_button.dart';
import 'package:mind_mint/presentation/widgets/stheme_progress_circle.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<QuestionsCubit>();
    int score = cubit.calculateScore();
    int total = cubit.questions.length;
    double percentage = (score / total);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Your Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff6D5458),
            ),
          ),
          const SizedBox(height: 30),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                SThemeProgressCircle(percentage: percentage),
                const SizedBox(height: 30),
                Text(
                  "$score Correct Answers of $total",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          ResultButton(
            text: "Show Answers",
            isGradient: true,
            onPressed: () {
              Navigator.pushNamed(
                context,
                showAnswerScreen,
                
              );
            },
          ),
          const SizedBox(height: 15),
          ResultButton(
            text: "Back to Home",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                homeScreen,
                (route) => false,
              );
            },
            isGradient: false,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
