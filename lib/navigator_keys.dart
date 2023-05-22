import 'package:flutter/material.dart';

class NavigatorKeys extends StatefulWidget {
  const NavigatorKeys({Key? key}) : super(key: key);

  @override
  State<NavigatorKeys> createState() => _NavigatorKeysState();
}

class _NavigatorKeysState extends State<NavigatorKeys> {
  List<Widget> statelessColors = [
    StatelessColor(color: Colors.amberAccent),
    StatelessColor(color: Colors.deepPurple),
  ];

  List<Widget> statefulColors = [
    StatefulColor(color: Colors.amberAccent,key: UniqueKey()),
    StatefulColor(color: Colors.deepPurple,key: UniqueKey()),
  ];

  void swapStatelessBoxes() {
    setState(() {
      statelessColors.insert(1, statelessColors.removeAt(0));
    });
  }

  void swapStatefulBoxes() {
    setState(() {
      statefulColors.insert(1, statefulColors.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Navigator Keys"),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: statelessColors,
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: statefulColors,
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                swapStatelessBoxes();
              },
              child: Text("Swap", style: TextStyle(fontSize: 25)),
            ),
            SizedBox(width: 25,),
            FloatingActionButton.large(
              onPressed: () {
                swapStatefulBoxes();
              },
              child: Text("Swap", style: TextStyle(fontSize: 25)),
            ),
          ],
        ));
  }
}

class StatefulColor extends StatefulWidget {

  final Color color;

  const StatefulColor({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ColoredBox(
        color: Colors.orange,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class StatelessColor extends StatelessWidget {

  final Color color;

  StatelessColor({super.key, required this.color, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 100,
        child: ColoredBox(
          color: color,
        ));
  }
}
