import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/view_model/token_view_model.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routeNames.dart';

class SplashModel {
  Future<UserModel> getuserdata() => TokenViewModel().getuser();

  void checkuserauthentication(BuildContext context) {
    getuserdata().then((value) async {
      print(value.token.toString());
      await Future.delayed(const Duration(seconds: 3));
      if (value.token.toString() == 'null' || value.token.toString() == " ") {
        Navigator.pushNamed(context, RoutesNames.Login);
      } else {
        await Future.delayed(const Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesNames.Home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
