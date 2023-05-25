import 'package:flutter/material.dart';

class MyData {
  final int id;
  final String name;

  MyData(this.id, this.name);
}

class MyObjectKey extends StatefulWidget {
  const MyObjectKey({Key? key}) : super(key: key);

  @override
  State<MyObjectKey> createState() => _MyObjectKeyState();
}

class _MyObjectKeyState extends State<MyObjectKey> {
  final MyData mydata1 = MyData(11, "Flutter");
  final MyData mydata2 = MyData(11, "Dart");
  late List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Object Key"),
        centerTitle: true,
      ),
      body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex--;
              }
              final item=tiles.removeAt(oldIndex);
              tiles.insert(newIndex,item);
            });
          },
          children: tiles),
    );
  }

  @override
  void initState() {
    tiles = [
      ObjectTiles(mydata: mydata1, key: ObjectKey(mydata1)),
      ObjectTiles(mydata: mydata2, key: ObjectKey(mydata2)),
    ];
  }
}

class ObjectTiles extends StatelessWidget {
  const ObjectTiles({
    super.key,
    required this.mydata,
  });

  final MyData mydata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mydata.name),
      leading: Text(mydata.id.toString()),
    );
  }
}
