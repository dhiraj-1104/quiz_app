import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/core/theme/theme.dart';
import 'package:quiz_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz',
      theme: theme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: RoutesNames.splash,
    );
  }
}
