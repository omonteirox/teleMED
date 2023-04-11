import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:telemed_app/components/appbar_component.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMed(title: "TeleMed"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/telemed-logo.png"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira seu e-mail"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira sua senha"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Lembrar minha senha")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Fazer Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text("Cadastre-se"),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("Esqueci minha senha"),
            ),
            SignInButton(
              Buttons.Google,
              text: "Entre com o Google",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
