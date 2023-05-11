import 'package:chapter6_navigation/named_route.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_two.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/onGenerateOne':
        return MaterialPageRoute(
          builder: (context) => GenerateOne(),
        );
      case '/onGenerateTwo':
        return MaterialPageRoute(
          builder: (context) => GenerateTwo(),
        );
      case '/onGenerateThree':
        return MaterialPageRoute(
          builder: (context) => GenerateThree(),
        );
      case '/NamedRoutes':
        if (args is Map<String, String>) {
          return MaterialPageRoute(builder: (context) {
            return MyNamedRoutes(
              name: args['name'] ?? 'Vinisha',
              age: args["age"] ?? '23',
              language: args["language"] ?? 'Flutter',
            );
          });
        }
        return errorRoute();
      default:
        return null;
    }
  }

  static Route<Widget> errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error", style: TextStyle(color: Colors.red)),
        ),
      );
    });
  }
}
