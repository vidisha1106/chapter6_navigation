import 'package:flutter/material.dart';

class Child2 extends StatefulWidget {

  Child2({Key? key,}) : super(key: key);

  @override
  State<Child2> createState() => _Child2State();
}

String textChild2='Child 2 Widget';

class _Child2State extends State<Child2> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            SizedBox(height: 25,),
            Text(textChild2,style: TextStyle(fontSize: 25)),
          ],
      ),
    );
  }
}
