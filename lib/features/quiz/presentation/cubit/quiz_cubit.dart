import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final List<QuestionEntity> question;
  int _currentIndex = 0;
  int _score = 0;
  QuizCubit(this.question) : super(QuizInitial());

  // Start the Quiz
  void startQuiz() {
    emit(QuizLoaded(question: question[_currentIndex]));
  }

  // Submit the answer
  void submitAnswer(int selectedIndex) {
    final currentQuestion = question[_currentIndex];
    final isCorrect = selectedIndex == currentQuestion.correctIndex;
    final context = currentQuestion.context[selectedIndex - 1];
    // print(currentQuestion.context[0]);
    // print(currentQuestion.context[1]);
    // print(currentQuestion.context[2]);
    // print(currentQuestion.context[3]);
    // print("Selected index is $selectedIndex");
    // print("The Selected index after adding one ${selectedIndex - 1}");
    // print(context);
    if (isCorrect) {
      _score++;
    }
    // print(selectedIndex);
    // print(currentQuestion.correctIndex);
    // print(isCorrect);
    emit(QuizAnswer(isCorrect: isCorrect, context: context));

    Future.delayed(Duration(seconds: 1), () {
      _currentIndex = _currentIndex + 1;
      if (_currentIndex < question.length) {
        emit(QuizLoaded(question: question[_currentIndex]));
      } else {
        emit(QuizCompleted(score: _score));
      }
    });
  }
}
