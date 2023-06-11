import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:telemed_app/login/view/stores/login_store.dart';
import 'package:telemed_app/reset-password/view/reset_password_view.dart';
import 'package:telemed_app/utils/routes/routes.dart';

import '../../theme_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginStore loginStore = LoginStore();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: themeProvider.toggleTheme,
                  icon: Icon(
                    themeProvider.isDark
                        ? Icons.lightbulb_outline
                        : Icons.lightbulb,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 30,
            ),
            child: Image.asset(
              "images/logo-simples.png",
              height: 120,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: TextFormField(
              validator: (value) => loginStore.emailError,
              onChanged: loginStore.setEmail,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: const Text("Insira seu e-mail"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: Observer(builder: (_) {
              return TextFormField(
                obscureText: loginStore.visiblePassword,
                controller: loginStore.passwordController,
                validator: (value) => loginStore.passwordError,
                onChanged: (value) {
                  loginStore.savePassword(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira sua senha"),
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginStore
                              .setVisiblePassword(!loginStore.visiblePassword);
                        },
                        icon: Icon(loginStore.visiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordView(),
                      ),
                    );
                  },
                  child: const Text("Esqueci minha senha"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Checkbox(
                      value: loginStore.rememberPassword,
                      onChanged: (value) {
                        loginStore.setRememberPassword(value!);
                        loginStore.saveRemember(value);
                        // _userStore.saveRemember();
                      });
                }),
                const Text("Lembrar minha senha")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Observer(builder: (_) {
                return ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      //if (formKey.currentState!.validate()) {
                      // loginStore.loginWithEmail(loginStore.email,
                      //     loginStore.password, loginStore.rememberPassword);
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.MEDIC, (route) => false);
                      // }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 30, right: 30),
                      child: Text(
                        "Fazer Login",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ));
              }),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SignInButton(Buttons.Google,
              text: "Entre com o Google", onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.SIGNON);
              },
              child: Column(
                children: const [
                  Text(
                    "Não possui uma conta?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Cadastre-se aqui",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
