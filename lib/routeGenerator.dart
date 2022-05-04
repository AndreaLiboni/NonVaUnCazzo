import 'package:flutter/material.dart';
import 'package:tapparelle/main.dart';
import 'package:tapparelle/room.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/room':
        return MaterialPageRoute(
            builder: (_) => Room(
                  ID: args as int,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
