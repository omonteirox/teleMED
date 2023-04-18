import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemed_app/login/view/login_view.dart';
import 'package:telemed_app/signup/view/singup_view.dart';
import 'package:telemed_app/utils/routes/routes.dart';
import 'package:telemed_app/theme_provider.dart';
import 'package:telemed_app/utils/themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            builder: Asuka.builder,
            navigatorObservers: [Asuka.asukaHeroController],
            title: 'TELEMED-APP',
            theme:
                theme.isDark ? AppThemes().darkTheme : AppThemes().whiteTheme,
            routes: {
              AppRoutes.HOME: (BuildContext context) => const Placeholder(),
              AppRoutes.LOGIN: (BuildContext context) => LoginView(),
              AppRoutes.SIGNON: (BuildContext context) => const SignUpView(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
