import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/stores/auth_store.dart';
import 'package:telemed_app/stores/user_store.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userStore = UserStore();
  final _authStore = AuthStore();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _userStore.readRemember().then((value) {
      if (value) {
        _userStore
            .readPassword()
            .then((value) => _passwordController.text = value);
      } else {
        _passwordController.text = '';
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMed(title: "TeleMed"),
        body: Observer(
          builder: (_) {
            if (_authStore.loading) {
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
                        child: Observer(builder: (_) {
                          return TextFormField(
                            obscureText: _userStore.visiblePassword,
                            controller: _passwordController,
                            validator: (value) => _userStore.passwordError,
                            onChanged: (value) {
                              _userStore.setPassword(value);
                              _userStore.readRemember().then((value) => {
                                    if (value) {_userStore.savePassword()}
                                  });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                label: Text("Insira sua senha"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _userStore.setVisiblePassword(
                                          !_userStore.visiblePassword);
                                    },
                                    icon: Icon(_userStore.visiblePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Observer(builder: (_) {
                              return Checkbox(
                                  value: _userStore.rememberPassword,
                                  onChanged: (value) {
                                    _userStore.setRememberPassword(value!);
                                    _userStore.saveRemember();
                                  });
                            }),
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
                                  _authStore.loading = true;
                                  await _authStore.login(_userStore);
                                  if (_authStore.error != null) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Erro'),
                                          content: Text(_authStore.error!),
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
                        onPressed: () async {
                          try {
                            await googleSignIn.signIn().then((value) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            });
                          } catch (e) {
                            print('Erro ao fazer login com o Google: $e');
                          }
                        },
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
