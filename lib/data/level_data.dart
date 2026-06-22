import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/model/level_model.dart';

class LevelData {
  static List<LevelModel> generateLevels() {
    return List.generate(10, (index) {
      int levelNum = index + 1;
      String difficulty = 'easy';
      int questions = 5;

      if (levelNum > 3 && levelNum <= 6) {
        difficulty = 'medium';
        questions = 10;
      } else if (levelNum > 6) {
        difficulty = 'hard';
        questions = 15;
      }
      return LevelModel(
        levelNumber: levelNum,
        difficulty: difficulty,
        isLocked: levelNum == 1 ? false : true,
        numOfQuestions: questions,
      );
    });
  }

  static Map<String, List<LevelModel>> categoryLevels = {
    AppStrings.science: generateLevels(),
    AppStrings.history: generateLevels(),
    AppStrings.geography: generateLevels(),
    AppStrings.animal: generateLevels(),
    AppStrings.animation: generateLevels(),
    AppStrings.art: generateLevels(),
    AppStrings.books: generateLevels(),
    AppStrings.computer: generateLevels(),
    AppStrings.film: generateLevels(),
    AppStrings.sports: generateLevels(),
    AppStrings.mathematics: generateLevels(),
    AppStrings.music: generateLevels(),
    AppStrings.videoGames: generateLevels(),
    AppStrings.mythology: generateLevels(),

  };
}
