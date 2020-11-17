import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/routing/routes.dart';
import 'package:MoneyTracker/view/intro.dart';
import 'package:flutter/material.dart';
import 'package:MoneyTracker/routing/namedRoutes.dart' as namedRoutes;

void main() {
  initializeServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      // builder: (context, child) => Scaffold(body: child),
      initialRoute: '/intro',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      routes: namedRoutes.routes,
    );
  }
}
