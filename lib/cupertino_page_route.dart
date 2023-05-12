import 'package:flutter/material.dart';

class MyCupertinoPageRoute extends StatefulWidget {
  const MyCupertinoPageRoute({Key? key}) : super(key: key);

  @override
  State<MyCupertinoPageRoute> createState() => _MyCupertinoPageRouteState();
}

class _MyCupertinoPageRouteState extends State<MyCupertinoPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoPageRoute"),
        centerTitle: true,
      ),
    );
  }
}
