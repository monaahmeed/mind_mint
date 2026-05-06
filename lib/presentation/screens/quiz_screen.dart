import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/cubit/questions_cubit.dart';
import 'package:mind_mint/business_logic/cubit/questions_state.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/presentation/widgets/quiz_view_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuestionsSuccess) {
            return QuizViewBody(questions:state.questions);
          } else if (state is QuestionsFailure) {
            return Center(child: Text(state.errMessage));
          }
          return const Center(child: Text("Start the quiz!"));
        },
      ),
    );
  }
}
