

import 'package:chapter6_navigation/global_key.dart';
import 'package:chapter6_navigation/main.dart';
import 'package:flutter/material.dart';

class MyCupertinoPageRoute extends StatefulWidget {

  final  GlobalKey<MyGlobalKeyState> counterKey;
  const MyCupertinoPageRoute({Key? key, required this.counterKey}) : super(key: key);


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
        child: Text("Value of Counter : ${counterKey.currentState?.counter}"),
      ),
    );
  }
}
