import 'package:flutter/material.dart';
import 'package:mvvm/view/SplashScreen.dart';
import 'package:mvvm/view/sign_up_screen.dart';
import 'routeNames.dart';
import 'package:mvvm/view/Login_View.dart';
import 'package:mvvm/view/homescreen.dart';

class Routes {
  static Route<dynamic> generateroutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.Splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesNames.Home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesNames.Login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesNames.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text('No relevant screen found'),
                )
              ],
            ),
          );
        });
    }
  }
}
