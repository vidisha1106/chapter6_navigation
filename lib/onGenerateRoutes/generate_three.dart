import 'package:flutter/material.dart';

class GenerateThree extends StatefulWidget {
  const GenerateThree({Key? key}) : super(key: key);

  @override
  State<GenerateThree> createState() => _GenerateThreeState();
}

class _GenerateThreeState extends State<GenerateThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Three"),
        centerTitle: true,
      ),
    );
  }
}
