import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/cubit/questions_state.dart';
import 'package:mind_mint/data/model/questions_model.dart';
import 'package:mind_mint/data/repository/questions_repository.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final QuestionsRepository questionsRepository;
  
  // المخزن بتاعنا
  List<QuestionModel> questions = [];
  Map<int, String> userAnswers = {};

  QuestionsCubit(this.questionsRepository) : super(QuestionsInitial());

  void getQuestions({
    required int amount,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    emit(QuestionsLoading());
    try {
      questions = await questionsRepository.fetchQuestions( 
        amount: amount,
        category: category,
        difficulty: difficulty,
        type: type,
      );
      userAnswers = {}; 
      emit(QuestionsSuccess(questions));
    } catch (e) {
      emit(QuestionsFailure("Opps! Check your internet connection."));
    }
  }

 
  void saveAnswer(int index, String answer) {
    userAnswers[index] = answer;
  }

  
  int calculateScore() {
    int score = 0;
    userAnswers.forEach((index, selectedAnswer) {
      if (selectedAnswer == questions[index].correctAnswer) {
        score++;
      }
    });
    return score;
  }
}