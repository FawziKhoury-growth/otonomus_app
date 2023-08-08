
import 'package:flutter/material.dart';
import 'package:task7/navigator/route_generator.dart';


class RouteNavigator{
  static void goTo (String routeName){
    RouteGenerator.navigatorKey.currentState?.pushNamed('/$routeName');
  }

  static void goToAndRemove (String routeName){
    RouteGenerator.navigatorKey.currentState?.pushNamedAndRemoveUntil('/$routeName', ModalRoute.withName('/$routeName'));
  }

  static void pushNamedAndRemoveUntil<T extends Object?>(String routeName, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    RouteGenerator.navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate,
      arguments: arguments,
    );
  }
}

