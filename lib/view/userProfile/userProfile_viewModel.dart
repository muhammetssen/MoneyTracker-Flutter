import 'package:MoneyTracker/locator.dart';
import 'package:flutter/cupertino.dart';

class UserProfile extends ChangeNotifier {
  String _userID, userName, name, email;
  List homes, income, outcome, alinacaklar, alinanlar;

  UserProfile(userInfo) {
    print(userInfo);
    this._userID = userInfo['_id'];
    this.userName = userInfo['username'];
    this.name = userInfo['name'];
    this.email = userInfo['email'];
    this.homes = userInfo['homes'];
    this.income = userInfo['income'];
    this.outcome = userInfo['outcome'];
    this.alinacaklar = userInfo['alinacaklar'];
    this.alinanlar = userInfo['alinanlar'];
    print("object created");
  }
  String get userID => this._userID;
}

Future<UserProfile> getUserInfo(String userID) async {
  var userInfo =
      await httpService.postRequest('user/getuser', body: {'_id': userID});
  print(userInfo);
  return UserProfile(userInfo['user']);
}
