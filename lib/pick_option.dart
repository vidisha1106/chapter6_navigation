import 'package:flutter/material.dart';

class PickOption extends StatefulWidget {

  const PickOption({Key? key}) : super(key: key);

  @override
  State<PickOption> createState() => _PickOptionState();
}

class _PickOptionState extends State<PickOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick an Option"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context,'Yup');
            }, child: Text("Yup")),

            ElevatedButton(onPressed: (){
              Navigator.pop(context,'Nope');
            }, child: Text("Nope")),
          ],
        ),
      ),
    );
  }
}
