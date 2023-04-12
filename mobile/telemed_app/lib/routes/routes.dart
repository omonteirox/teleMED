import 'package:flutter/material.dart';
import 'package:telemed_app/view/home_screen.dart';
import 'package:telemed_app/view/login_screen.dart';
import 'package:telemed_app/view/singin_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (BuildContext context) => LoginScreen(),
  '/signin': (BuildContext context) => SignInScreen(),
  '/home': (BuildContext context) => HomeScreen()
};
