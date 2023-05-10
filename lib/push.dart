import 'package:flutter/material.dart';

class MySecondPage extends StatefulWidget {
  final String name;
  final String language;

  const MySecondPage({
    Key? key,
    required this.name,
    required this.language,
  }) : super(key: key);

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            Text(widget.language),
            TextButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': widget.name,
                  'language': widget.language,
                });
              },
              child: Text("Pop"),
            )
          ],
        ),
      ),
    );
  }
}
