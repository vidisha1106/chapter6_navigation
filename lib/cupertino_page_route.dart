

import 'package:chapter6_navigation/main.dart';
import 'package:flutter/material.dart';

class MyCupertinoPageRoute extends StatefulWidget {

    MyCupertinoPageRoute();

  @override
  State<MyCupertinoPageRoute> createState() => _MyCupertinoPageRouteState();
}

class _MyCupertinoPageRouteState extends State<MyCupertinoPageRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CupertinoPageRoute"),
        centerTitle: true,
      ),
      body: Center(
         child: Text("Value of Counter : ${counterKey.currentState?.counter}",style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
