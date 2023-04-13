import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class AppBarMed extends StatefulWidget implements PreferredSizeWidget {
  AppBarMed({super.key, required this.title});
  final String title;
  @override
  State<AppBarMed> createState() => _AppBarMedState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarMedState extends State<AppBarMed> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      centerTitle: true,
      title: Text(widget.title),
      actions: [
        IconButton(
          onPressed: themeProvider.toggleTheme,
          icon: Icon(
              themeProvider.isDark ? Icons.lightbulb_outline : Icons.lightbulb,
              color: Colors.white),
        ),
      ],
    );
  }
}
