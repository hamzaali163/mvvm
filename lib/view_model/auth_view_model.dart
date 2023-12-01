import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/view_model/token_view_model.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routeNames.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool loading = false;
  progressIndicator(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<dynamic> authloginapi(dynamic details, BuildContext context) async {
    progressIndicator(true);

    _myrepo.loginapi(details).then((value) {
      progressIndicator(true);
      final userprefrences =
          Provider.of<TokenViewModel>(context, listen: false);
      userprefrences.saveuser(UserModel(
        token: value['token'].toString(),
      ));
      GeneralUtils.showflushbarmessage('Login Successful', context);
      progressIndicator(false);
      Navigator.pushNamed(context, RoutesNames.Home);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      progressIndicator(false);

      if (kDebugMode) {
        progressIndicator(false);
        print(error.toString());
        print(details.toString());

        GeneralUtils.showflushbarmessage(error.toString(), context);
      }
    });
  }

  Future<dynamic> authSignapi(dynamic details, BuildContext context) async {
    _myrepo.Registerapi(details).then((value) {
      GeneralUtils.showflushbarmessage('Login Successful', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
        print(details.toString());

        GeneralUtils.showflushbarmessage(error.toString(), context);
      }
    });
  }
}
