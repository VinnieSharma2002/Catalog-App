import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.homeRoute,
      debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
        },
        );
  }
}


