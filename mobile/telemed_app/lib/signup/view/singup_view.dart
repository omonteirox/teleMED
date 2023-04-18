import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:telemed_app/components/appbar_component.dart';
import 'package:telemed_app/signup/view/stores/sign_up_store.dart';
import 'package:telemed_app/utils/routes/routes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final SignUpStore signUpStore = SignUpStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMed(title: "Realize seu Cadastro"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset("images/telemed-logo.png"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: signUpStore.setName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira seu Nome"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  // onChanged: _userStore.setPhone,
                  // validator: (value) => _userStore.phoneError,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira seu Telefone"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: signUpStore.setEmail,
                  validator: (value) => signUpStore.emailError,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira seu E-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(builder: (_) {
                  return TextFormField(
                    obscureText: signUpStore.visiblePassword,
                    onChanged: signUpStore.setPassword,
                    validator: (value) => signUpStore.passwordError,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text("Insira sua senha"),
                        suffixIcon: IconButton(
                            onPressed: () {
                              signUpStore.setVisiblePassword(
                                  !signUpStore.visiblePassword);
                            },
                            icon: Icon(signUpStore.visiblePassword
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  );
                }),
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await signUpStore
                          .signUp(signUpStore.name, signUpStore.email,
                              signUpStore.password)
                          .then((value) {
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.LOGIN, (route) => false);
                        }
                      });
                    }
                  },
                  child: const Text("Realizar Cadastro"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
