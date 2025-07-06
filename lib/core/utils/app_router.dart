import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_app/features/quiz/presentation/screens/home_screen.dart';
import 'package:quiz_app/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/splash/splash_screen.dart';

// Routes 
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => SplachScreen(),);
      case RoutesNames.home:
      return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesNames.quiz:
      final args = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) => QuizScreen(questions: args['questions'] as List<QuestionEntity>,
      name: args['name'] as String,),);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("Error 404"))),
        );
    }
  }
}
