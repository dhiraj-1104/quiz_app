import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel( {
    required super.question,
    required super.options,
    required super.correctIndex,
    required super.context,
  });

  // Converting the json into dart object 
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      options: json['options'],
      correctIndex: json['correctIndex'],
      context:json['context']
    );
  }
}
