import 'package:flutter/material.dart';

class MyNamedRoutes extends StatefulWidget {
  final String data;

  const MyNamedRoutes(this.data);

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
      body: Center(child: Text(widget.data),
      ),
    );
  }
}
