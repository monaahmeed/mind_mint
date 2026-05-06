class QuestionModel {
  final String question;
  final String correctAnswer;
  final List<String> allAnswers; 
  QuestionModel({
    required this.question,
    required this.correctAnswer,
    required this.allAnswers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
  
    List<String> answers = List<String>.from(json['incorrect_answers']);
    answers.add(json['correct_answer']);
    answers.shuffle(); 

    return QuestionModel(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      allAnswers: answers,
    );
  }
}