import 'package:hive/hive.dart';

part 'level_model.g.dart';
@HiveType(typeId: 0)
class LevelModel {
  @HiveField(0)
  final int levelNumber;
  @HiveField(1)
  final String difficulty;
  @HiveField(2)
  final int numOfQuestions;
  @HiveField(3)
  final bool isLocked;
   @HiveField(4)
  final bool isCompleted;
  LevelModel({
    required this.levelNumber,
    required this.difficulty,
    required this.isLocked,
    required this.numOfQuestions,
   this.isCompleted = false,
  });
}
