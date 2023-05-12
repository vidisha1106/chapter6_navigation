import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRouteTransition extends StatefulWidget {
  const MyRouteTransition({Key? key}) : super(key: key);

  @override
  State<MyRouteTransition> createState() => _MyRouteTransitionState();
}

class _MyRouteTransitionState extends State<MyRouteTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Transition"),
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent,
    );
  }
}
