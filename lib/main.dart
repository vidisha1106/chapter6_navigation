import 'package:chapter6_navigation/onGenerateRoutes/generate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_two.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_route_main.dart';
import 'package:chapter6_navigation/push.dart';
import 'package:chapter6_navigation/named_route.dart';
import 'package:chapter6_navigation/generate_routes/route_generator_class.dart';
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
        return RouteGenerator.generateRoute(settings);
        /*if(settings.name =='/NamedRoutes'){
          if(settings.arguments is String)
            {
              return MaterialPageRoute(builder: (BuildContext context) {
                return MyNamedRoutes("Yooooohooooooooo");
              });
            }
          else{
            return RouteGenerator.errorRoute();
          }
        }*/
      },
      routes: {
        //'/NamedRoutes' : (context) => MyNamedRoutes('absxgdgdgdgc'),
        '/GenerateOne': (context) => GenerateOne(),
        '/GenerateTwo': (context) => GenerateTwo(),
        '/GenerateThree': (context) => GenerateThree(),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
            onPressed: () {
              Navigator.pushNamed(context, '/NamedRoutes', arguments: {
                'name': 'Vidisha',
                'age': '22',
                'language': 'Flutter'
              });
              //Navigator.pushNamed(context, '/NamedRoutes', arguments: 507);
              //Navigator.push(context,MaterialPageRoute(builder: (context) => MyNamedRoutes("")));
            },
            child: Text("Named Route", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnGenerateRoutes()));
            },
            child: Text("onGenerate Route", style: TextStyle(fontSize: 18)),
          ),
        ],
      )),
    );
  }
}
