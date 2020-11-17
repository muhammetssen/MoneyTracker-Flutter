import 'package:MoneyTracker/view/register/register_view.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class RegisterViewModel extends ChangeNotifier {
  String name;
  String email;
  String password;
  String rePassword;
  String username;
  bool saving = false;
  bool showAlert = false;
  String alertMessage = '';

  void sendForm(BuildContext context) async {
    if (password != rePassword) {
      print("Error");
      return;
    }
    this.saving = true;
    notifyListeners();
    Map<String, String> formData = {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'username': this.username
    };
    var res = await httpService.postRequest('user/signup', body: formData);
    // print(res);

    this.saving = false;
    notifyListeners();
    if (res['message'] == 'Success') {
      this._navigateUserProfile(res['userID']);
    } else {
      registerView.showAlertDialog(context, res['message']);
    }
  }

  void navigateLogin() {
    navigator.navigateTo('/login', replace: true);
  }

  void _navigateUserProfile(String userID) {
    print("Going to user Profile");
    navigator
        .navigateTo('/userPage', replace: true, parameters: {'userID': userID});
  }
}
