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
        //'/GenerateOne': (context) => const GenerateOne(),
        '/GenerateTwo': (context) => const GenerateTwo(),
        '/GenerateThree': (context) => const GenerateThree(),
        '/CupertinoPageRoute': (context) => const MyCupertinoPageRoute(),
        '/CommunicationBetweenScreens': (context) => MyCommunication(
              data: textFieldData,
            ),
        '/CommunicationBetweenWidgets': (context) =>
            const WidgetCommunication(),
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
                title: const Text("Do You Want to Exit??"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("No"),
                  )
                ],
              );
            });
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Navigation"),
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
                        builder: (context) => const MySecondPage(
                          name: 'vidisha',
                          language: 'Flutter',
                        ),
                      ));
                  setState(() {});
                },
                child: const Text("Push", style: TextStyle(fontSize: 18)),
              ),
              Text(data?['name'] ?? ''),
              Text(data?['language'] ?? ''),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/NamedRoutes', arguments: {
                    'name': "Vidisha",
                    'age': '22',
                    'language': 'Flutter'
                  });
                  //Navigator.pushNamed(context, '/NamedRoutes', arguments: 507);
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => MyNamedRoutes("")));
                },
                child:
                    const Text("Named Route", style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnGenerateRoutes()));
                },
                child: const Text("onGenerate Route",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const MyCupertinoPageRoute(),
                      ));
                },
                child: const Text("CupertinoPageRoute",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        barrierColor: Colors.blueGrey,
                        transitionDuration: const Duration(seconds: 2),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const MyRouteTransition();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(1, 0), end: Offset(0, 0))
                                    .animate(animation),
                            child: child,
                          );
                        },
                      ));
                },
                child: const Text("Slide Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        reverseTransitionDuration: Duration(seconds: 2),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const MyRouteTransition();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return ScaleTransition(
                              scale: Tween(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOutCubic)),
                              child: child);
                        },
                      ));
                },
                child: const Text("Scale Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 3),
                        reverseTransitionDuration: Duration(seconds: 3),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const MyRouteTransition();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.bounceOut)),
                            child: child,
                          );
                        },
                      ));
                },
                child: const Text("Rotation Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        reverseTransitionDuration: Duration(seconds: 3),
                        transitionDuration: Duration(seconds: 3),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const MyRouteTransition();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return Align(
                              child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ));
                        },
                      ));
                },
                child: const Text("Size Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        reverseTransitionDuration: Duration(seconds: 1),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return const MyRouteTransition();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ));
                },
                child: const Text("Fade Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      CustomRouteTransition(child: const MyRouteTransition()));
                },
                child: const Text("Custom Route Transition",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, FadeAndScaleRoute(MyRouteTransition()));
                },
                child: const Text("fade and scale Route Transition",
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/CommunicationBetweenScreens',
                          arguments: textFieldData);
                    },
                    child: const Text("Switch"),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/CommunicationBetweenWidgets',
                  );
                },
                child: const Text("Widget Communication",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () async {
                  final option = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PickOption(),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(option),
                  ));
                },
                child: const Text("Return Data From a Screen",
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SendingDataToNewScreen();
                    },
                  ));
                },
                child: const Text("Send Data To a New Screen",
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
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                child,
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                child) {
              return Stack(children: [
                ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(animation),
                  child: child,
                ),
                FadeTransition(
                  opacity: animation,
                  child: child,
                )
              ]);
            });

// @override
// Widget buildTransitions(BuildContext context, Animation<double> animation,
//     Animation<double> secondaryAnimation, Widget child) {
//   return Stack(children: [
//     ScaleTransition(
//       scale: Tween(begin: 0.0, end: 1.0).animate(animation),
//       child: child,
//     ),
//     FadeTransition(
//       opacity: animation,
//       child: child,
//     )
//   ]);
// }
}

class FadeAndScaleRoute extends PageRouteBuilder {
  final Widget page;

  FadeAndScaleRoute(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(seconds: 5),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(animation),
                child: child,
              ),
              FadeTransition(
                opacity: animation,
                child: child,
              ),
            ],
          ),
        );
}
