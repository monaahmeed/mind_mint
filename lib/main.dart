import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mind_mint/app_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/challenge_cubit/challenge_cubit.dart';
import 'package:mind_mint/business_logic/questions_cubit/questions_cubit.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/data_sources/challenge_local_data_source.dart';
import 'package:mind_mint/data/model/level_model.dart';
import 'package:mind_mint/data/repository/questions_repository.dart';
import 'package:mind_mint/data/web_services/questions_web_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LevelModelAdapter());
  await Hive.openBox(AppStrings.levelsBox);
  final questionsWebServices = QuestionsWebServices();
  final questionsRepository = QuestionsRepository(questionsWebServices);
  final challengeLocalDataSource = ChallengeLocalDataSource();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuestionsCubit(questionsRepository)),
        BlocProvider(create: (context) => ChallengeCubit(challengeLocalDataSource)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
