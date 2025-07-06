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
    if(isCorrect){
      _score ++;
    }
    // print(selectedIndex);
    // print(currentQuestion.correctIndex);
    // print(isCorrect);
    emit(QuizAnswer(isCorrect: isCorrect));

    Future.delayed(Duration(seconds: 4), () {
      _currentIndex = _currentIndex + 1;
      if (_currentIndex < question.length) {
        emit(QuizLoaded(question: question[_currentIndex]));
      } else {
        emit(QuizCompleted(score: _score));
      }
    });
  }
}
