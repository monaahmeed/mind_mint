import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/questions_cubit/questions_cubit.dart';

import 'package:mind_mint/data/model/category_model.dart';
import 'package:mind_mint/presentation/screens/quiz_screen.dart';
import 'package:mind_mint/presentation/widgets/questions_widgets.dart';

class QuestionDetailsBody extends StatefulWidget {
  const QuestionDetailsBody({super.key,required this.category});
  final CategoryModel category;
  @override
  State<QuestionDetailsBody> createState() => _QuestionDetailsBodyState();
}

class _QuestionDetailsBodyState extends State<QuestionDetailsBody> {
String selectedDifficulty = 'easy';

  String selectedType = 'multiple';

  double numberOfQuestions = 10;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 217, 210),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Text(
                  widget.category.displayName,
                  style: const TextStyle(
                    color: Color(0xff8C6A6B),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            
            const SectionTitle(
              icon: Icons.bar_chart,
              title: "Difficulty Level",
            ),
            Row(
              children: [
                CustomChoiceChip(
                  label: "Easy",
                  value: 'easy',
                  groupValue: selectedDifficulty,
                  onSelected: (val) => setState(() => selectedDifficulty = val),
                ),
                CustomChoiceChip(
                  label: "Medium",
                  value: 'medium',
                  groupValue: selectedDifficulty,
                  onSelected: (val) => setState(() => selectedDifficulty = val),
                ),
                CustomChoiceChip(
                  label: "Hard",
                  value: 'hard',
                  groupValue: selectedDifficulty,
                  onSelected: (val) => setState(() => selectedDifficulty = val),
                ),
              ],
            ),
            SizedBox(height: 15),

           
            SectionTitle(icon: Icons.quiz_outlined, title: "Question Type"),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffFAF2F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CustomChoiceChip(
                    label: "Multiple Choice",
                    value: 'multiple',
                    groupValue: selectedType,
                    onSelected: (val) => setState(() => selectedType = val),
                  ),

                  CustomChoiceChip(
                    label: "True / False",
                    value: 'boolean',
                    groupValue: selectedType,
                    onSelected: (val) => setState(() => selectedType = val),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SectionTitle(
              icon: Icons.list,
              title: "Number of Questions",
              value: numberOfQuestions.toInt(),
            ),
            Slider(
              value: numberOfQuestions,
              min: 5,
              max: 50,
              divisions: 9,
              activeColor: const Color(0xffF9919C),
              onChanged: (val) => setState(() => numberOfQuestions = val),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7B525A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  context.read<QuestionsCubit>().getQuestions(
                    amount: numberOfQuestions.toInt(),
                    category: widget.category.id, 
                    difficulty: selectedDifficulty.toLowerCase(),
                    type: selectedType,
                  );

                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                child: const Text(
                  "Begin Journey ✨",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
  }
}