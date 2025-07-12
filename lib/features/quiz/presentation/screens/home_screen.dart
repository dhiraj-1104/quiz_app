import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/core/theme/custom_colors.dart';
import 'package:quiz_app/core/utils/dialog.dart';
import 'package:quiz_app/core/widgets/custome_button.dart';
import 'package:quiz_app/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';

// Home Screen
class HomeScreen extends StatelessWidget {
  final quizRepo = QuizRepositoryImpl();
  final TextEditingController textEditingController = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didpop) async {
        bool shouldExit = await showExitConfirmationDialog(context);
        if (shouldExit) {
          exit(0);
          // SystemNavigator.pop();
        }
      },
      child: Scaffold(
        // backgroundcolor
        backgroundColor: middleGreen,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      SizedBox(
                        height: 180,
                        width: 180,

                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(95),
                          child: Image.asset(
                            "assets/images/quizlogo.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "Enter your Name.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "Your Name....",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10,
                  ),
                  child: CustomButton(
                    color: orange,
                    text: "Start Quiz",
                    onPressed: () async {
                      List<QuestionEntity> questions = await quizRepo
                          .getQuestions();

                      if (context.mounted) {
                        Navigator.pushNamed(
                          context,
                          RoutesNames.quiz,
                          arguments: {
                            'questions': questions,
                            'name': textEditingController.text,
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
