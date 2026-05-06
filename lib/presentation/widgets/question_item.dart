import 'package:flutter/material.dart';
import 'package:mind_mint/data/model/questions_model.dart';

class QuestionItem extends StatelessWidget {
  final QuestionModel questionModel;
  final int index; 
  final int totalQuestions; 

  const QuestionItem({
    super.key,
    required this.questionModel,
    required this.index,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 32,left: 32,top: 16,bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xffFDF9F8),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xffE5DBF3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text("Question ${index + 1} of $totalQuestions", style: TextStyle(color: Color(0xff6E6381))),
              ),
              SizedBox(height: 10),
              Text(
                questionModel.question,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
      ],
    );
  }
}
