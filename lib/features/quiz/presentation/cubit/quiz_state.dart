import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

//  initial where the quiz question are not loaded
class QuizInitial extends QuizState {}

class QuizLoaded extends QuizState {
  final QuestionEntity question;
  QuizLoaded({required this.question});

  @override
  List<Object?> get props => [question];
}

class QuizAnswer extends QuizState {
  final bool isCorrect;
  QuizAnswer({required this.isCorrect});

  @override
  List<Object?> get props => [isCorrect];
}

class QuizCompleted extends QuizState {
  final int score;
  QuizCompleted({required this.score});

  @override
  List<Object?> get props => [score];
}
