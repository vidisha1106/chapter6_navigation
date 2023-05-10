import 'package:chapter6_navigation/main.dart';
import 'package:chapter6_navigation/named_route.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_two.dart';
import 'package:flutter/material.dart';

class OnGenerateRoutes extends StatefulWidget {
  const OnGenerateRoutes({Key? key}) : super(key: key);

  @override
  State<OnGenerateRoutes> createState() => _OnGenerateRoutesState();
}

class _OnGenerateRoutesState extends State<OnGenerateRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnGenerate Routes"),
        centerTitle: true,
      ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: ()  {},
            child: Text("onGenerate One", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: ()  {
            },
            child: Text("onGenerate Two", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: ()  {
            },
            child: Text("onGenerate Three", style: TextStyle(fontSize: 18)),
          ),
        ],
      )),
    );
  }
}


/*class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/onGenerateOne' : return MaterialPageRoute(builder: (context) => OnGenerateOne(),);
      case '/onGenerateTwo' : return MaterialPageRoute(builder: (context) => OnGenerateTwo(),);
      case '/onGenerateThree' : return MaterialPageRoute(builder: (context) => OnGenerateThree(),);
      //case '/NamedRoutes' :
    default: return MaterialPageRoute(builder: (context) => MyHomePage(),);
    }
}*/
