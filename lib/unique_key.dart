import 'package:flutter/material.dart';

class MyUniqueKey extends StatefulWidget {
  const MyUniqueKey({Key? key}) : super(key: key);

  @override
  State<MyUniqueKey> createState() => _MyUniqueKeyState();
}

class _MyUniqueKeyState extends State<MyUniqueKey> {

  late List<Widget> statefultiles;

  @override
  Widget build(BuildContext context) {

    void swapStatefulTiles() {
      setState(() {
        statefultiles.insert(1, statefultiles.removeAt(0));
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Unique Key"),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: statefultiles,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            swapStatefulTiles();
          },
          child: const Text("Swap", style: TextStyle(fontSize: 25)),
        ));
  }

  @override
  void initState() {
    super.initState();
    statefultiles = [
      StatefulColorTile(
         key: UniqueKey() ,
        color: Colors.deepPurpleAccent,
      ),
      StatefulColorTile(
        key: UniqueKey(),
        color: Colors.deepOrange,
      ),
    ];
  }
}


class StatefulColorTile extends StatefulWidget {
  final Color color;

  const StatefulColorTile({Key? key, required this.color}) : super(key: key);

  @override
  State<StatefulColorTile> createState() => _StatefulColorTileState();
}

class _StatefulColorTileState extends State<StatefulColorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      height: 100,
      width: 100,
    );
  }
}
