import 'package:flutter/material.dart';
import 'package:mind_mint/presentation/widgets/costum_app_bar.dart';
import 'package:mind_mint/presentation/widgets/result_view_body.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: const CostumAppBar(),
      body: ResultViewBody(
        levelModel: args?['levelModel'],
        categoryName: args?['categoryName'],
      ),
    );
  }
}