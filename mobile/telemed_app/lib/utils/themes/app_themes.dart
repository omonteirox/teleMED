import 'package:flutter/material.dart';
import 'package:telemed_app/utils/animations/transition_animation.dart';

class AppThemes {
  ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: CustomPageTransitionBuilder()}),
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(0, 7, 23, 6),
      primary: Color.fromRGBO(244, 244, 244, 1),
    ),
    fontFamily: 'Montserrat',
  );
  ThemeData whiteTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: CustomPageTransitionBuilder()}),
    colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(244, 244, 244, 1),
      primary: Colors.black,
    ),
    fontFamily: 'Montserrat',
  );
}
