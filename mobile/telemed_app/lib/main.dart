import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemed_app/routes/routes.dart';
import 'package:telemed_app/theme_provider.dart';
import 'package:telemed_app/themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:
                theme.isDark ? AppThemes().darkTheme : AppThemes().whiteTheme,
            routes: appRoutes,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
