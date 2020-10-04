import 'dart:convert';

import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/routing/resources/images.dart';
import 'package:MoneyTracker/routing/resources/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:MoneyTracker/globals.dart';

class registerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<RegisterViewModel>.nonReactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Flexible(
              child: Hero(
                tag: 'app-icon',
                child: Container(
                  height: 150,
                  child: Image.asset(Images.icon),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyles.input,
                      onChanged: (value) => model.name = value,
                      decoration:
                          Decorations.input.copyWith(labelText: 'Name Surname'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyles.input,
                      onChanged: (value) => model.email = value,
                      decoration:
                          Decorations.input.copyWith(labelText: 'E-mail'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyles.input,
                      onChanged: (value) => model.username = value,
                      decoration:
                          Decorations.input.copyWith(labelText: 'Username'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyles.input,
                      onChanged: (value) => model.password = value,
                      obscureText: true,
                      decoration: Decorations.input.copyWith(
                          labelText: 'Password',
                          contentPadding: EdgeInsets.zero),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyles.input,
                      obscureText: true,
                      onChanged: (value) => model.rePassword = value,
                      decoration: Decorations.input.copyWith(
                          labelText: 'Re-enter Password',
                          contentPadding: EdgeInsets.zero),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  // side:BorderSide(color: Colors.blue)
                ),
                onPressed: model.sendForm,
                color: Colors.red,
                child: Text(
                  'Register',
                  style: TextStyles.button,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyles.info,
                children: [
                  TextSpan(text: 'If you have already an account'),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  TextSpan(
                    text: 'Go To Login',
                    style: TextStyles.infoClickable,
                    recognizer: TapGestureRecognizer()
                      ..onTap = model.navigateLogin,
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class RegisterViewModel extends ChangeNotifier {
  String name;
  String email;
  String password;
  String rePassword;
  String username;

  void sendForm() async {
    if (password != rePassword) {
      print("Error");
      return;
    }
    Response res = await post(globals.URL + 'user/signup',
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          'name': this.name,
          'email': this.email,
          'password': this.password,
          'username': this.username
        }));
  }

  void navigateLogin() {
    navigator.navigateTo('/login', replace: true);
  }
}
