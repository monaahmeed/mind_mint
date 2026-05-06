import 'package:flutter/material.dart';
import 'package:mind_mint/business_logic/cubit/questions_cubit.dart';
import 'package:mind_mint/app_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/data/repository/questions_repository.dart';
import 'package:mind_mint/data/web_services/questions_web_services.dart';

void main() {
  final questionsWebServices = QuestionsWebServices();
  final questionsRepository = QuestionsRepository(questionsWebServices);
  runApp(
    BlocProvider(
      create: (context) => QuestionsCubit(questionsRepository),
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
