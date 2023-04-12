import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/stores/user_store.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _userStore = UserStore();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBarMed(title: "TeleMed"),
        body: Observer(
          builder: (_) {
            if (_userStore.loading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 0,
                    child: Align(
                      child: Image.asset("images/telemed-logo.png"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              );
            } else {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset("images/telemed-logo.png"),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (value) => _userStore.emailError,
                          onChanged: _userStore.setEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            label: Text("Insira seu e-mail"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (value) => _userStore.passwordError,
                          onChanged: _userStore.setPassword,
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
                          Observer(builder: (_) {
                            return ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _userStore.loading = true;
                                  await _userStore.login();
                                  if (_userStore.error != null) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Erro'),
                                          content: Text(_userStore.error!),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    Navigator.pushNamed(context, '/home');
                                  }
                                }
                              },
                              child: Text("Fazer Login"),
                            );
                          }),
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
          },
        ));
  }
}
