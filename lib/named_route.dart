import 'package:flutter/material.dart';

class MyNamedRoutes extends StatefulWidget {

  final String name;
  final String age;
  final String language;

  const MyNamedRoutes({required this.name, required this.age, required this.language});

  @override
  State<MyNamedRoutes> createState() => _MyNamedRoutesState();
}

class _MyNamedRoutesState extends State<MyNamedRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Routes"),
        centerTitle: true,
      ),
      body: Center(child: Text("${widget.name}\n${widget.age}\n${widget.language}"),
      ),
    );
  }
}
