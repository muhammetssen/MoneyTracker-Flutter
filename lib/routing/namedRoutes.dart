
import 'package:MoneyTracker/view/intro.dart';
import 'package:MoneyTracker/view/login/login_view.dart';
import 'package:MoneyTracker/view/register/register_view.dart';
import 'package:MoneyTracker/view/userProfile/userProfile_view.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/intro': (context) => introView(),
  '/register' : (context)=>  registerView(),
  '/login' : (context) => loginView(),
  '/userPage': (context) => UserProfileView(),

};
