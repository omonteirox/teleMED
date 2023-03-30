import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TeleMed"),
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
      ),
      body: Column(
        children: [
          Image.asset("images/telemed-logo.png"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text("Insira seu e-mail"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text("Insira sua senha"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Fazer Login"),
          ),
          SignInButton(
            Buttons.Google,
            text: "Entre com o Google",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
