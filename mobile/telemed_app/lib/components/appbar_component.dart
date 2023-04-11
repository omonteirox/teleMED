import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        Switch(
          value: themeProvider.isDark,
          onChanged: (value) {
            setState(() {
              themeProvider.toggleTheme();
            });
          },
        ),
      ],
    );
  }
}
