import 'package:flutter/material.dart';

const String homeScreen = '/';
const backgroundColor = Color(0xffFCF7F3);
const String questionsDetailsScreen = '/questions_details_screen';
const String resultScreen = '/result_screen';
const String showAnswerScreen = '/show_answer_screen';
const String challengeLevelsScreen = '/challenge_levels_screen';

class AppStrings {
  static const String computer = 'Computer';
  static const String science = 'Science';
  static const String art = 'Art';
  static const String books = 'Books';
  static const String geography = 'Geography';
  static const String history = 'History';
  static const String animal = 'Animal';
  static const String animation = 'Animation';
  static const String mathematics = 'Mathematics';
  static const String film = 'Film';
  static const String mythology = 'Mythology';
  static const String music = 'Music';
  static const String videoGames = 'video games';
  static const String sports = 'sports';
  static const String levelsBox = 'levels_box';
  static String getCategoryKey(String categoryName) =>
      '${categoryName.toLowerCase()}_progress';
}
