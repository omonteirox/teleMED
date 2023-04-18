import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/login/view/stores/login_store.dart';
import 'package:telemed_app/utils/routes/routes.dart';

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
    return Scaffold(
        appBar: AppBarMed(title: "Faça seu Login!"),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Image.asset("images/telemed-logo.png"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) => loginStore.emailError,
                  onChanged: loginStore.setEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira seu e-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                              loginStore.setVisiblePassword(
                                  !loginStore.visiblePassword);
                            },
                            icon: Icon(loginStore.visiblePassword
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          loginStore.loginWithEmail(loginStore.email,
                              loginStore.password, loginStore.rememberPassword);
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.HOME, (route) => false);
                        }
                      },
                      child: const Text("Fazer Login"),
                    );
                  }),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.SIGNON);
                    },
                    child: const Text("Cadastre-se"),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Esqueci minha senha"),
              ),
              SignInButton(Buttons.Google,
                  text: "Entre com o Google", onPressed: () {})
            ]),
          ),
        ));
  }
}
