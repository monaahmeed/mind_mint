import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/business_logic/challenge_cubit/challenge_cubit.dart';
import 'package:mind_mint/data/model/category_model.dart';
import 'package:mind_mint/data/model/level_model.dart';
import 'package:mind_mint/presentation/screens/quiz_screen.dart';
import 'package:mind_mint/presentation/widgets/level_circle.dart';
import 'package:mind_mint/presentation/widgets/whole_path_painter.dart';

class ChallengeLevelsScreen extends StatefulWidget {
  const ChallengeLevelsScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<ChallengeLevelsScreen> createState() => _ChallengeLevelsScreenState();
}

class _ChallengeLevelsScreenState extends State<ChallengeLevelsScreen> {
  final List<int> levels = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<Offset> levelPositions = [];

  final double itemHeight = 140.0;
  final double startY = 80.0;

  final int userCurrentLevel = 1;

  @override
  void didChangeDependencies() {
    if (levelPositions.isEmpty) {
      double screenWidth = MediaQuery.of(context).size.width;
      double paddingFromEdges = 125.0;

      double leftX = paddingFromEdges;
      double rightX = screenWidth - paddingFromEdges;

      for (int i = 0; i < levels.length; i++) {
        bool isLeft = i % 2 != 0;
        double x = isLeft ? leftX : rightX;
        double y = startY + (i * itemHeight);
        levelPositions.add(Offset(x, y));
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (levelPositions.isEmpty) return const Scaffold();

    return Scaffold(
      backgroundColor: const Color(0xFFFCF7F3),
      appBar: AppBar(
        title: Text(
          widget.category.displayName,
          style: const TextStyle(
            color: Color(0xFF4A3656),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF4A3656)),
      ),
      body: BlocBuilder<ChallengeCubit, ChallengeState>(
        builder: (context, state) {
          if (state is ChallengeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ChallengeLoaded) {
            final List<LevelModel> currentLevels = state.levels;
            double totalHeight =
                startY + (currentLevels.length * itemHeight) + 40.0;

            return SingleChildScrollView(
              child: SizedBox(
                height: totalHeight,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: WholePathPainter(
                            points: levelPositions,
                            color: const Color(0xFF8B5A5A).withOpacity(0.35),
                          ),
                        ),
                      ),
                    ),

                    ...List.generate(currentLevels.length, (index) {
                      final levelModel = currentLevels[index];
                      final pos = levelPositions[index];

                      
                      return Positioned(
                        left: pos.dx - 38,
                        top: pos.dy - 38,
                        child: LevelCircleWidget(
                          level: levelModel.levelNumber,
                          isCompleted: levelModel.isCompleted,
                          isActive:
                              !levelModel.isLocked && !levelModel.isCompleted,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  levelModel: levelModel,
                                  categoryId: widget.category.id,
                                  categoryName: widget
                                      .category
                                      .displayName, 
                                  quizType: 'multiple',
                                ),
                              ),
                            );

                            if (mounted) {
                              
                              context.read<ChallengeCubit>().loadLevels(
                                widget.category.displayName,
                              );
                            }
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }

          if (state is ChallengeError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text("No levels found."));
        },
      ),
    );
  }
}
