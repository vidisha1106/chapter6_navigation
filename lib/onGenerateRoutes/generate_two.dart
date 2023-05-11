import 'package:flutter/material.dart';

class GenerateTwo extends StatefulWidget {
  const GenerateTwo({Key? key}) : super(key: key);

  @override
  State<GenerateTwo> createState() => _GenerateTwoState();
}

class _GenerateTwoState extends State<GenerateTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two"),
        centerTitle: true,
      ),
    );
  }
}
