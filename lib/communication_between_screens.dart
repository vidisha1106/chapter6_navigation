import 'package:flutter/material.dart';

class MyCommunication extends StatefulWidget {

  final String data;

  const MyCommunication({Key? key, required this.data}) : super(key: key);

  @override
  State<MyCommunication> createState() => _MyCommunicationState();
}

class _MyCommunicationState extends State<MyCommunication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communication Between Screens"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(widget.data),
      )
    );
  }
}
