import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/routes_name.dart';
import 'package:quiz_app/splash/splash_screen.dart';

// Routes 
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => SplachScreen(),);
      case RoutesNames.home:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('Home Screen'),),),);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("Error 404"))),
        );
    }
  }
}
