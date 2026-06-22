import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/questions_cubit/questions_cubit.dart';
import 'package:mind_mint/business_logic/questions_cubit/questions_state.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/model/level_model.dart';
import 'package:mind_mint/presentation/widgets/quiz_view_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    super.key,
    this.levelModel,
    this.categoryId,
    this.quizType,
    this.categoryName,
  });
  final LevelModel? levelModel;
  final int? categoryId;
  final String? quizType;
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    
    if (levelModel != null) {
      BlocProvider.of<QuestionsCubit>(context).getQuestions(
        amount: levelModel!.numOfQuestions,
        category: categoryId ?? 0,
        difficulty: levelModel!.difficulty.toLowerCase(),
        type: quizType ?? 'multiple',
      );
    } else {}
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuestionsSuccess) {
            return QuizViewBody(
              questions: state.questions,
              levelModel: levelModel, 
              categoryName: categoryName
            );
          } else if (state is QuestionsFailure) {
            return Center(child: Text(state.errMessage));
          }
          return const Center(child: Text("Start the quiz!"));
        },
      ),
    );
  }
}
