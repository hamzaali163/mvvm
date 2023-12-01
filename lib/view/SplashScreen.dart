import 'package:flutter/material.dart';
import 'package:mvvm/view_model/Splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashModel().checkuserauthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Splash Screen',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    ));
  }
}
