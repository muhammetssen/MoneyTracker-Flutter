import 'package:MoneyTracker/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

Widget introView() => Scaffold(
      body: ViewModelBuilder.nonReactive(
          viewModelBuilder: () => IntroViewModel(),
          onModelReady: (model) => model.init(),
          builder: (context, model, child) => Container(
                child: Center(
                  child: Text("Intro"),
                ),
              )),
    );

class IntroViewModel extends ChangeNotifier {
  init() async {
    await Future.delayed(Duration(seconds: 1));
    navigator.navigateTo('/register', replace: true);
  }
}
