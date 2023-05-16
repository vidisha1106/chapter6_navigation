import 'package:chapter6_navigation/communication_between_screens.dart';
import 'package:chapter6_navigation/communication_between_widgets.dart';
import 'package:chapter6_navigation/cupertino_page_route.dart';
import 'package:chapter6_navigation/navigation_observer.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_one.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_three.dart';
import 'package:chapter6_navigation/onGenerateRoutes/generate_two.dart';
import 'package:chapter6_navigation/onGenerateRoutes/onGenerate_route_main.dart';
import 'package:chapter6_navigation/pick_option.dart';
import 'package:chapter6_navigation/push.dart';
import 'package:chapter6_navigation/generate_routes/route_generator_class.dart';
import 'package:chapter6_navigation/route_transition.dart';
import 'package:chapter6_navigation/send_data_to_new_scereen.dart';
import 'package:flutter/cupertino.dart';
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
      navigatorObservers: [MyNavigationObserver()],
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
      initialRoute: '/',
      routes: {
        //'/NamedRoutes' : (context) => MyNamedRoutes('absxgdgdgdgc'),
        '/GenerateOne': (context) => GenerateOne(),
        '/GenerateTwo': (context) => GenerateTwo(),
        '/GenerateThree': (context) => GenerateThree(),
        '/CupertinoPageRoute': (context) => MyCupertinoPageRoute(),
        '/CommunicationBetweenScreens': (context) =>
            MyCommunication(data: textFieldData,),
        '/CommunicationBetweenWidgets': (context) => WidgetCommunication()
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

String textFieldData = '';

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingController = TextEditingController();
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Do You Want to Exit??"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("No"),
                  )
                ],
              );
            });
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Navigation"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MySecondPage(
                                  name: 'vidisha',
                                  language: 'Flutter',
                                ),
                          ));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnGenerateRoutes()));
                    },
                    child: Text(
                        "onGenerate Route", style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => MyCupertinoPageRoute(),
                          ));
                    },
                    child: Text(
                        "CupertinoPageRoute", style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return MyRouteTransition();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation,
                                child) {
                              final tween =
                              Tween(begin: Offset(-1, 1), end: Offset.zero)
                                  .chain(
                                  CurveTween(
                                      curve: Curves.fastLinearToSlowEaseIn));
                              final offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Text("Slide Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return MyRouteTransition();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation,
                                child) {
                              return ScaleTransition(
                                  child: child,
                                  scale: Tween(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOutCubic)));
                            },
                          ));
                    },
                    child: Text("Scale Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return MyRouteTransition();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation,
                                child) {
                              return RotationTransition(
                                child: child,
                                turns: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOutBack)),
                              );
                            },
                          ));
                    },
                    child: Text("Rotation Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return MyRouteTransition();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation,
                                child) {
                              return Align(
                                  child: SizeTransition(
                                    sizeFactor: animation,
                                    child: child,
                                  ));
                            },
                          ));
                    },
                    child:
                    Text("Size Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return MyRouteTransition();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation,
                                child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                    },
                    child:
                    Text("Fade Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CustomRouteTransition(child: MyRouteTransition()));
                    },
                    child: Text("Custom Route Transition",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: textEditingController,
                        onChanged: (value) {
                          textFieldData = value;
                        },
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.pushNamed(
                            context, '/CommunicationBetweenScreens',
                            arguments: textFieldData);
                      }, child: Text("Switch"),)
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context, '/CommunicationBetweenWidgets',);
                    },
                    child: Text("Widget Communication",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      final option=await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PickOption(),));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(option),));
                    },
                    child: Text("Return Data From a Screen",
                        style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SendingDataToNewScreen();
                      },));
                    },
                    child: Text("Send Data To a New Screen",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CustomRouteTransition extends PageRouteBuilder {
  final Widget child;

  CustomRouteTransition({required this.child})
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration(seconds: 2));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: animation, child: child);
  }
}
