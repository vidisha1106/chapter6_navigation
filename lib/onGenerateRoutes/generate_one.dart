import 'package:flutter/material.dart';

class GenerateOne extends StatefulWidget {
  const GenerateOne({Key? key}) : super(key: key);

  @override
  State<GenerateOne> createState() => _GenerateOneState();
}

class _GenerateOneState extends State<GenerateOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One"),
        centerTitle: true,
      ),
    );
  }
}
