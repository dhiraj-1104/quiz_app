import 'package:quiz_app/features/quiz/data/model/question_model.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_app/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<List<QuestionEntity>> getQuestions() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      QuestionModel(
        question: "What is Flutter?",
        options: [
          "A programming language",
          "A database",
          "An SDK for building cross-platform apps",
          "A backend framework",
        ],
        correctIndex: 3,
      ),
      QuestionModel(
        question: "Which programming language is used to build Flutter apps?",
        options: ["Kotlin", "Dart", "Java", "Swift"],
        correctIndex: 2,
      ),
      QuestionModel(
        question: "Which widget is used for layout in a vertical direction?",
        options: ["Row", "Column", "Stack", "ListTile"],
        correctIndex: 2,
      ),
    ];
  }
}
