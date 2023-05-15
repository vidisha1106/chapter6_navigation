import 'package:flutter/cupertino.dart';

class MyNavigationObserver extends RouteObserver
{

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didPush method is called..... $route");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didPop method is called..... $route");
  }
}