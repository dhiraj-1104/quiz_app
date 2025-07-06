import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/core/theme/custom_colors.dart';

// Splash Screen
class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    // These moves to the next screen after the 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesNames.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: middleGreen,
      body: Center(
        child: SizedBox(
          height: 180,
          width: 180,

          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(95),
            child: Image.asset("assets/images/quizlogo.jpg", fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
