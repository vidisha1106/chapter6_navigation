import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_two.dart';
import 'package:chapter6_navigation/onGenerate_route.dart';
import 'package:chapter6_navigation/push.dart';
import 'package:chapter6_navigation/named_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {

      },
      routes: {
        '/NamedRoutes' : (context) => MyNamedRoutes('absxgdgdgdgc'),
        '/onGenerateOne' : (context) => OnGenerateOne(),
        '/onGenerateTwo' : (context) => OnGenerateTwo(),
        '/onGenerateThree' : (context) => OnGenerateThree(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MySecondPage(
                            name: 'vidisha',
                            language: 'Flutter',
                          )));
              setState(() {});
            },
            child: Text("Push", style: TextStyle(fontSize: 18)),
          ),
          Text(data?['name'] ?? ''),
          Text(data?['language'] ?? ''),
          ElevatedButton(
            onPressed: ()  {
                Navigator.of(context).pushNamed('/thirdPage');
            },
            child: Text("Named Route", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: ()  {
              Navigator.push(context,MaterialPageRoute(builder: (context) => OnGenerateRoutes()));
            },
            child: Text("onGenerate Route", style: TextStyle(fontSize: 18)),
          ),
        ],
      )),
    );
  }
}
