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
      body: Center(child: Text("Welcome to the quize App.....",style: Theme.of(context).textTheme.bodyMedium,)));
  }
}
