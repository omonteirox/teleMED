import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/stores/user_store.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _userStore = UserStore();
    return Scaffold(
      appBar: AppBarMed(title: "Realize seu cadstro"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  validator: (value) => _userStore.phoneError,
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
                  validator: (value) => _userStore.emailError,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: Text("Insira seu E-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(builder: (_) {
                  return TextFormField(
                    obscureText: true,
                    onChanged: _userStore.setPassword,
                    validator: (value) => _userStore.passwordError,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      label: Text("Insira sua senha"),
                    ),
                  );
                }),
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _userStore.register();
                      if (_userStore.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(_userStore.error!),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Usuário criado com sucesso"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    }
                  },
                  child: Text("Realizar Cadastro"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
