import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class registerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) => Container(
        child: Center(
          child: Text("as"),
        ),
      ),
    );
  }
}


class RegisterViewModel extends ChangeNotifier {}
