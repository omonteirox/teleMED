import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/controllers/sigin_controller.dart';
import 'package:telemed_app/stores/user_store.dart';
import 'package:telemed_app/validators/validator.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _userStore = UserStore();
    return Scaffold(
      appBar: AppBarMed(title: "Cadastre-se!"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/telemed-logo.png"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: _userStore.setName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira seu Nome"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: _userStore.setPhone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira seu Telefone"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: _userStore.setEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira seu E-mail"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                obscureText: true,
                onChanged: _userStore.setPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("Insira sua senha"),
                ),
              ),
            ),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed: _userStore.isFormValid
                    ? () {
                        SignInController.registerUser(
                            _userStore.name, _userStore.password);
                      }
                    : null,
                child: Text("Realizar Cadastro"),
              );
            })
          ],
        ),
      ),
    );
  }
}
