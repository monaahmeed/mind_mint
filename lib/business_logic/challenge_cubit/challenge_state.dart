part of'challenge_cubit.dart';


@immutable
abstract class ChallengeState {}
class ChallengeInitial extends ChallengeState {}
class ChallengeLoading extends ChallengeState {}
class ChallengeLoaded extends ChallengeState {
  final List<LevelModel> levels; 
  final int currentProgress;     
  ChallengeLoaded({required this.levels, required this.currentProgress});
}
class ChallengeError extends ChallengeState {
  final String message;
  ChallengeError(this.message);
}