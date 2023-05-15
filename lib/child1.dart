import 'package:chapter6_navigation/child2.dart';
import 'package:chapter6_navigation/communication_between_widgets.dart';
import 'package:flutter/material.dart';

class Child1 extends  StatefulWidget {

  final Function(String) onChanged;
  TabController tabController;
  Child1({Key? key, required this.onChanged, required this.tabController}) : super(key: key);

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
          SizedBox(height: 25,),
          Text(textChild1,style: TextStyle(fontSize: 25)),
          SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
              widget.onChanged('Update Parent Class');
            },
            child: Text("Action2"),
          ),
          SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
                setState(() {
                  textChild2="Updated from Child 1";
                });
            },
            child: Text("Action3"),
          ),
          SizedBox(height: 25,),
          ElevatedButton(
            onPressed: () {
              widget.tabController.index=1;
            },
            child: Text("Action4"),
          ),
        ],
      ),
    );
  }
}
