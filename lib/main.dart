import 'package:flutter/material.dart';
import 'package:mvvm/view_model/token_view_model.dart';
import 'package:mvvm/utils/Routes.dart';
import 'package:mvvm/utils/routeNames.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => TokenViewModel()),
        //ChangeNotifierProvider(create: (_) => HomeViewMode()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: RoutesNames.Splash,
        onGenerateRoute: Routes.generateroutes,
      ),
    );
  }
}
