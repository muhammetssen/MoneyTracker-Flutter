import 'package:MoneyTracker/routing/resources/styles.dart';
import 'package:MoneyTracker/view/userProfile/userProfile_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatelessWidget {
  String userID;
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    this.userID = args['userID'];
    var width = MediaQuery.of(context).size.width;
    // print(this.userID);
    return Scaffold(
      body: FutureBuilder(
          future: getUserInfo(this.userID),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ViewModelBuilder<UserProfile>.reactive(
                viewModelBuilder: () => snapshot.data,
                builder: (context, model, child) => Container(
                  color: Colors.blue[100],
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red[200],borderRadius: BorderRadius.circular(40)),
                            height: width/3,
                            child: Image.asset('images/personIcon.png'),
                          ),
                          SizedBox(height: 10,),
                          Text("Hello ${model.name}",style: TextStyles.info.copyWith(fontSize: 30,fontWeight: FontWeight.w700),),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
