import 'package:flutter/material.dart';

class MyValueKey extends StatefulWidget {
  const MyValueKey({Key? key}) : super(key: key);

  @override
  State<MyValueKey> createState() => _MyValueKeyState();
}

class _MyValueKeyState extends State<MyValueKey> {
  late List todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Value Key"),
          automaticallyImplyLeading: true,
        ),
        body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
             if(newIndex>oldIndex) newIndex--;
              final item=todos.removeAt(oldIndex);
              todos.insert(newIndex,item);
            });
          },
          children: todos.map((item) {
            return ListTile(
              key: ValueKey(item),
                title: Text(item),
              trailing: Icon(Icons.menu),
            );
          },).toList(),
        ));
  }

  @override
  void initState() {
    todos = ["Breakfast", "Lunch", "Dinner"];
  }
}
