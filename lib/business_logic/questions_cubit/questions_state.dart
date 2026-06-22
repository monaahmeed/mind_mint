import 'package:mind_mint/data/model/questions_model.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {} 

class QuestionsSuccess extends QuestionsState {
  final List<QuestionModel> questions;
  QuestionsSuccess(this.questions);
}

class QuestionsFailure extends QuestionsState {
  final String errMessage;
  QuestionsFailure(this.errMessage);
}