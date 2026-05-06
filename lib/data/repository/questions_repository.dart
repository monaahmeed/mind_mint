import 'package:mind_mint/data/model/questions_model.dart';
import 'package:mind_mint/data/web_services/questions_web_services.dart';

class QuestionsRepository {
  final QuestionsWebServices questionsWebServices;

  QuestionsRepository(this.questionsWebServices);

  Future<List<QuestionModel>> fetchQuestions({
    required int amount,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    
    final List<dynamic> questions = await questionsWebServices.getQuestions(
      amount: amount,
      category: category,
      difficulty: difficulty,
      type: type,
    );

    
    return questions.map((question) => QuestionModel.fromJson(question)).toList();
  }
}