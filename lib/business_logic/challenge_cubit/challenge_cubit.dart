import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_mint/data/data_sources/challenge_local_data_source.dart';
import 'package:mind_mint/data/level_data.dart';
import 'package:mind_mint/data/model/level_model.dart';

part 'challenge_state.dart';

class ChallengeCubit extends Cubit<ChallengeState> {
  ChallengeCubit(this.challengeLocalDataSource) : super(ChallengeInitial());
  final ChallengeLocalDataSource challengeLocalDataSource;
  void loadLevels(String categoryName) {
    emit(ChallengeLoading());
    try {
      int progress = challengeLocalDataSource.getProgress(categoryName);
      List<LevelModel> allLevels = LevelData.categoryLevels[categoryName] ?? [];
      List<LevelModel> updatedLevels = allLevels.map((level) {
        bool isCompleted = level.levelNumber < progress;

        bool isLocked = level.levelNumber > progress;
        return LevelModel(
          levelNumber: level.levelNumber,
          difficulty: level.difficulty,
          
          isLocked: isLocked,
          isCompleted: isCompleted,
          numOfQuestions: level.numOfQuestions,
        );
      }).toList();
      emit(ChallengeLoaded(levels: updatedLevels, currentProgress: progress));
    } catch (e) {
      emit(ChallengeError('there was an error'));
    }
  }

  Future<void> updateProgress(String categoryName, int completedLevel) async {
    try {
      int nextLevel = completedLevel + 1;

      await challengeLocalDataSource.saveProgress(categoryName, nextLevel);

      loadLevels(categoryName);
    } catch (e) {
      emit(ChallengeError('Failed to update progress'));
    }
  }
}
