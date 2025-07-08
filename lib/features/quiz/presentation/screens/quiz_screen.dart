import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/core/theme/custom_colors.dart';
import 'package:quiz_app/core/widgets/custome_button.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/quiz_state.dart';

class QuizScreen extends StatefulWidget {
  final List<QuestionEntity> questions;
  final String name;
  const QuizScreen({super.key, required this.questions, required this.name});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedValue;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(widget.questions)..startQuiz(),
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomButton(
                        text: "Next",
                        color: darkGreen,
                        onPressed: () {
                          if (selectedIndex != null) {
                            context.read<QuizCubit>().submitAnswer(
                              selectedIndex!,
                            );
                          } else {
                            // Show an alert
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please select an option")),
                            );
                          }
                        },
                      ),
              ),
              // ignore: deprecated_member_use
              backgroundColor: middleGreen,
              appBar: AppBar(
                backgroundColor: middleGreen,
                automaticallyImplyLeading: false,
                title: Text(
                  "${widget.questions.indexOf(state.question) + 1}/${widget.questions.length}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                leadingWidth: 150,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.arrow_back_ios_new),
                      SizedBox(width: 8),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(blurRadius: 5)],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                "Question ${widget.questions.indexOf(state.question) + 1} : ${state.question.question}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Transform.translate(
                              offset: Offset(0, -30),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value:
                                      (widget.questions
                                          .indexOf(state.question) 
                                          .toDouble() /
                                      widget.questions.length),
                                  color: darkGreen,
                                  backgroundColor: lightGreen,
                                  strokeWidth: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      ...state.question.options.map((e) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              RadioListTile(
                                value: e,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  selectedValue = value;
                                  selectedIndex =
                                      state.question.options.indexOf(
                                        selectedValue as String,
                                      ) +
                                      1;
                  
                                  // print(selectedIndex);
                  
                                  setState(() {});
                                },
                                title: Text(e),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height:50)
                    ],
                  ),
                ),
              ),
            );
          } else if (state is QuizAnswer) {
            return Scaffold(
              backgroundColor: middleGreen,
              body: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: state.isCorrect == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 50,
                              color: darkGreen,
                            ),
                            Text(
                              "Correct",
                              style: TextStyle(
                                color: darkGreen,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                state.context,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: middleGreen,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 50,
                              color: Colors.red,
                            ),
                            Text(
                              "Incorrect",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                state.context,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: middleGreen,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          } else if (state is QuizCompleted) {
            return Scaffold(
              backgroundColor: middleGreen,
              body: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Congratulations ${widget.name.isEmpty ? 'user' : widget.name},",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Your Score",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "${state.score}/${widget.questions.length}",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: "Back to Home",
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          RoutesNames.home,
                        ),
                        color: darkGreen,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is QuizInitial) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
