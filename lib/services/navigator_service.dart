import 'package:flutter/cupertino.dart';
import 'package:MoneyTracker/routing/routes.dart';
import 'package:get_it/get_it.dart';

class NavigatorService {
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get currentState => navigatorKey.currentState;

  Future<T> navigateTo<T>(String routeName, {bool replace = false, parameters }) {
    return replace
        ? currentState.pushReplacementNamed(routeName,arguments: parameters)
        : currentState.pushNamed(routeName,arguments: parameters);
  }

  void goBack<T extends Object>([T result]) => currentState.pop(result);
}
