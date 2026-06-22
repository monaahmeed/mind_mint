import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/challenge_cubit/challenge_cubit.dart';
import 'package:mind_mint/business_logic/questions_cubit/questions_cubit.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/model/level_model.dart';
import 'package:mind_mint/presentation/widgets/result_button.dart';
import 'package:mind_mint/presentation/widgets/stheme_progress_circle.dart';

class ResultViewBody extends StatelessWidget {
  final LevelModel? levelModel;
  final String? categoryName;

  const ResultViewBody({super.key, this.levelModel, this.categoryName});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<QuestionsCubit>();
    int score = cubit.calculateScore();
    int total = cubit.questions.length;
    double percentage = (score / total);

    String titleText = "Your Result";
    String subtitleText = "";
    String primaryBtnText = "Show Answers";
    VoidCallback primaryBtnAction = () {
      Navigator.pushNamed(context, showAnswerScreen);
    };

    String secondaryBtnText = "Back to Home";
    VoidCallback secondaryBtnAction = () {
      Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
    };

    if (levelModel != null) {
      bool isPassed = percentage >= 0.50;

      if (isPassed) {
        titleText = "Level ${levelModel!.levelNumber} Complete!";
        subtitleText =
            "Amazing Progress! Level ${levelModel!.levelNumber + 1} is now unlocked!";

        primaryBtnText = "Next Level";
        primaryBtnAction = () async {
          
          if (categoryName != null) {
            
            await context.read<ChallengeCubit>().updateProgress(
              categoryName!,
              levelModel!.levelNumber,
            );
          }

         
          Navigator.pop(context);
          Navigator.pop(context);
        };

        secondaryBtnText = "Review Answers";
        secondaryBtnAction = () {
          Navigator.pushNamed(context, showAnswerScreen);
        };
      } else {
        primaryBtnText = "Retry Level";
        primaryBtnAction = () {
          cubit.userAnswers.clear();

          Navigator.pop(context);
        };

        secondaryBtnText = "Back to Map";
        secondaryBtnAction = () {
          Navigator.pop(context);
          Navigator.pop(context);
        };
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff6D5458),
            ),
          ),
          if (subtitleText.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              subtitleText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff8B7477),
              ),
            ),
          ],
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
            text: primaryBtnText,
            isGradient: true,
            onPressed: primaryBtnAction,
          ),
          const SizedBox(height: 15),

          ResultButton(
            text: secondaryBtnText,
            onPressed: secondaryBtnAction,
            isGradient: false,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
