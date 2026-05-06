import 'package:flutter/material.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/model/category_model.dart';
import 'package:mind_mint/presentation/screens/home_screen.dart';
import 'package:mind_mint/presentation/screens/questions_details_screen.dart';
import 'package:mind_mint/presentation/screens/result_screen.dart';
import 'package:mind_mint/presentation/screens/show_answer_screen.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case questionsDetailsScreen:
        final category = setting.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => QuestionsDetailsScreen(category: category),
        );
      case resultScreen:
  return MaterialPageRoute(
    builder: (_) => const ResultScreen(), // مفيش برامترز!
  );

case showAnswerScreen:
  return MaterialPageRoute(
    builder: (_) => const ShowAnswerScreen(), // مفيش برامترز!
  
  );
      default:
        return null;
    }
  }
}
