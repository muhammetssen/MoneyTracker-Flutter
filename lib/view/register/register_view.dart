import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/routing/resources/images.dart';
import 'package:MoneyTracker/routing/resources/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class registerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder.reactive(
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
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyles.input,
                      decoration:
                          Decorations.input.copyWith(labelText: 'E-mail'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyles.input,
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
  void sendForm() {}

  void navigateLogin() {
    navigator.navigateTo('/login', replace: true);
  }
}
