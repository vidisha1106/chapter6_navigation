import 'package:flutter/material.dart';

class SendingDataToNewScreen extends StatefulWidget {
  const SendingDataToNewScreen({Key? key}) : super(key: key);

  @override
  State<SendingDataToNewScreen> createState() => _SendingDataToNewScreenState();
}

class Todo{
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos=List.generate(10, (index) => Todo("Todo $index", "discription of $index"));

class _SendingDataToNewScreenState extends State<SendingDataToNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data To a New Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
          return ListTile(title: Text(todos[index].title),);
        },),
      ),
    );
  }
}
