import 'package:flutter/material.dart';

import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/model/category_model.dart';
import 'package:mind_mint/presentation/widgets/question_details_body.dart';

class QuestionsDetailsScreen extends StatelessWidget {
  final CategoryModel category;
  QuestionsDetailsScreen({super.key, required this.category});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Mind Mint',
            style: TextStyle(
              color: Color(0xffF9919C),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xffF8B1B9), size: 28),

        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: QuestionDetailsBody(category: category),
    );
  }
}
