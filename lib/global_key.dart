import 'package:flutter/material.dart';

import 'main.dart';



class MyGlobalKey extends StatefulWidget {
  const MyGlobalKey({Key? key}) : super(key: key);

  @override
  State<MyGlobalKey> createState() => MyGlobalKeyState();
}

class MyGlobalKeyState extends State<MyGlobalKey> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      // counter++;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Global Key"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times : ",
                style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 25,
            ),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            incrementCounter();
            print(counter.toString());
          },
          child: Icon(Icons.add)),
    );
  }
}
