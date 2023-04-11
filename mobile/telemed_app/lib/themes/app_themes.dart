import 'package:flutter/material.dart';

class AppThemes {
  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(0, 7, 23, 6),
      primary: Color.fromRGBO(244, 244, 244, 1),
    ),
    fontFamily: 'Montserrat',
  );
  ThemeData whiteTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(244, 244, 244, 1),
      primary: Colors.black,
    ),
    fontFamily: 'Montserrat',
  );
}
