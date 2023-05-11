import 'package:chapter6_navigation/main.dart';
import 'package:chapter6_navigation/named_route.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_two.dart';
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,'/GenerateOne');
            },
            child: Text("Generate One", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,'/GenerateTwo');
            },
            child: Text("Generate Two", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,'/GenerateThree');
            },
            child: Text("Generate Three", style: TextStyle(fontSize: 18)),
          ),
        ],
      )),
    );
  }
}

