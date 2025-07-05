import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  static Scaffold generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      default: 
        return Scaffold(
          body: Center(
            child: Text("Error 404"),
          ),
        );
    }
  }
  
  }