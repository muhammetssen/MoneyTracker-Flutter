import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/routing/resources/images.dart';
import 'package:MoneyTracker/routing/resources/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class loginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                child: Hero(tag: 'app-icon', child: Image.asset(Images.icon))),
            Padding(
              padding: const EdgeInsets.all(30.0),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          style: TextStyles.input,
                          obscureText: true,
                          decoration: Decorations.input.copyWith(
                              labelText: 'Password',
                              contentPadding: EdgeInsets.zero),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Forget Your Password?',
                            style: TextStyles.infoClickable,
                            recognizer: TapGestureRecognizer()
                              ..onTap = model.forgetPassword,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: model.sendForm,
                color: Colors.red,
                child: Text(
                  'Login',
                  style: TextStyles.button,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyles.info,
                children: [
                  TextSpan(text: 'If you do not have an account'),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  TextSpan(
                    text: 'Go To Register',
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

class LoginViewModel extends ChangeNotifier {
  void sendForm() {}

  void navigateLogin() {
    navigator.navigateTo('/register', replace: true);
  }

  void forgetPassword(){
    
  }
}
