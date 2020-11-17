import 'package:MoneyTracker/locator.dart';
import 'package:MoneyTracker/routing/resources/images.dart';
import 'package:MoneyTracker/routing/resources/styles.dart';
import 'package:MoneyTracker/view/register/register_viewModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class registerView extends StatelessWidget {
  static void showAlertDialog(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      // ignore: missing_return
      pageBuilder: (
        context,
        animation1,
        animation2,
      ) {},
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
            scale: animation.value,
            child: Opacity(
              opacity: animation.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: Text(message,style: TextStyles.info.copyWith(fontSize: 20,fontWeight: FontWeight.w400),),
                actions: [ MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    // side:BorderSide(color: Colors.blue)
                  ),
                  onPressed: () => navigator.goBack(),
                  color: Colors.red,
                  child: Text(
                    'Okay',
                    style: TextStyles.button,
                    textAlign: TextAlign.center,
                  ),
                ),],
              ),
            ));
      },
    );
    // print("a");
    // Future.delayed(Duration(seconds: 1)).then((value) => navigator.goBack());
    // navigator.goBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.saving,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Hero(
                tag: 'app-icon',
                child: Container(
                  height: 150,
                  child: Image.asset(Images.icon),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyles.input,
                        onChanged: (value) => model.name = value,
                        decoration: Decorations.input
                            .copyWith(labelText: 'Name Surname'),
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
                  onPressed: () => model.sendForm(context),
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
      ),
    );
  }
}
