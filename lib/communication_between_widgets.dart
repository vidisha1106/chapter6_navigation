import 'package:chapter6_navigation/child1.dart';
import 'package:chapter6_navigation/child2.dart';
import 'package:flutter/material.dart';

class WidgetCommunication extends StatefulWidget {
  const WidgetCommunication({Key? key}) : super(key: key);

  @override
  State<WidgetCommunication> createState() => _WidgetCommunicationState();
}

String textParent = 'My Parent Title';



class _WidgetCommunicationState extends State<WidgetCommunication> with SingleTickerProviderStateMixin{

 TabController? tabController;

 changeParent(String text) {
   setState(() {
     textParent = text;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Communication Between Widgets"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                textParent,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textChild1 = "Updated from Parent";
                  });
                },
                child: const Text("Action1"),
              ),
              const SizedBox(
                height: 25,
              ),
              TabBar(
                controller: tabController,
                tabs: const [
                  Tab(
                    child:
                        Text("Child 1", style: TextStyle(color: Colors.blue)),
                  ),
                  Tab(
                    child:
                        Text("Child 2", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Child1(
                      tabController: tabController!,
                      onChanged: changeParent,
                    ),
                    const Child2()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController=TabController(length: 2, vsync: this,);
  }
}
