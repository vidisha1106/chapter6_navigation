import 'package:chapter6_navigation/child2.dart';
import 'package:flutter/material.dart';

class Child1 extends  StatefulWidget {

  final Function(String) onChanged;
  final TabController tabController;
  const Child1({Key? key, required this.onChanged, required this.tabController}) : super(key: key);

  @override
  State<Child1> createState() => _Child1State();
}

String textChild1='Child 1 Widget';


class _Child1State extends State<Child1> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 25,),
          Text(textChild1,style: const TextStyle(fontSize: 25)),
          const SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
              widget.onChanged('Update Parent Class');
            },
            child: const Text("Action2"),
          ),
          const SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
                setState(() {
                  textChild2="Updated from Child 1";
                });
            },
            child: const Text("Action3"),
          ),
          const SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
              widget.tabController.index=1;
            },
            child: const Text("Action4"),
          ),
        ],
      ),
    );
  }
}
