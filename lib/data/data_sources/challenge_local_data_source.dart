import 'package:hive/hive.dart';
import 'package:mind_mint/constants.dart';

class ChallengeLocalDataSource {
  final Box box = Hive.box(AppStrings.levelsBox);
  Future<void> saveProgress(String categoryName, int levelNumber) async {
    await box.put(AppStrings.getCategoryKey(categoryName), levelNumber);
  }

 int getProgress(String categoryName) {
  return box.get(AppStrings.getCategoryKey(categoryName), defaultValue: 1);
}

}

