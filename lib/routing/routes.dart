import 'package:MoneyTracker/view/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:MoneyTracker/view/intro.dart';

Widget createView(String route) {
  switch (route) {
    case 'intro':
      return introView();
    case 'register':
      return registerView();
    default:
      return introView();
  }
}
