import 'package:chapter6_navigation/cupertino_page_route.dart';
import 'package:flutter/material.dart';

class MyGlobalKey extends StatefulWidget {
  const MyGlobalKey({Key? key}) : super(key: key);

  @override
  State<MyGlobalKey> createState() => MyGlobalKeyState();
}



class MyGlobalKeyState extends State<MyGlobalKey> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyCupertinoPageRoute();
                },
              ));
            },
          )
        ],
        centerTitle: true,
        title: const Text("Global Key"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times : ",
                style: TextStyle(fontSize: 20)),
            const SizedBox(
              height: 25,
            ),
            Text(
              counter.toString(),
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            incrementCounter();
            // print(counterKey.currentState!.counter.toString());
          },
          child: const Icon(Icons.add)),
    );
  }
}
