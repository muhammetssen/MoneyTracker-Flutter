import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/view/intro.dart';
import 'package:flutter/material.dart';

void main() {
  initializeServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      builder: (context, child) => Scaffold(body: child),
      home: introView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
      
    );
  }
}
