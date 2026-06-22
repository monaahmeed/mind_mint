import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/challenge_cubit/challenge_cubit.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/data_sources/challenge_local_data_source.dart';
import 'package:mind_mint/data/model/category_model.dart';
import 'package:mind_mint/presentation/screens/challenge_levels_screen.dart';
import 'package:mind_mint/presentation/screens/home_screen.dart';
import 'package:mind_mint/presentation/screens/questions_details_screen.dart';
import 'package:mind_mint/presentation/screens/result_screen.dart';
import 'package:mind_mint/presentation/screens/show_answer_screen.dart';

class AppRoute {
  
  static Route? generateRoute(RouteSettings settings) { 
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case questionsDetailsScreen:
        final category = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => QuestionsDetailsScreen(category: category),
        );
        
      case resultScreen:
        return MaterialPageRoute(builder: (_) => const ResultScreen());

      case showAnswerScreen:
        return MaterialPageRoute(builder: (_) => const ShowAnswerScreen());

      case challengeLevelsScreen:
        final category = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            
            create: (context) => ChallengeCubit(ChallengeLocalDataSource())..loadLevels(category.displayName),
            child: ChallengeLevelsScreen(category: category),
          ),
        );

      default:
        return null;
    }
  }
}