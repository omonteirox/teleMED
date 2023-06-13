import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:telemed_app/reset-password/view/stores/reset_password_store.dart';
import 'package:telemed_app/utils/routes/routes.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordStore resetPasswordStore = new ResetPasswordStore();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, false),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          right: 30,
        ),
        child: Form(
          key: formKey,
          child: ListView(children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("images/reset-password.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as intruções para restauração de sua senha.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) {
                return TextFormField(
                  validator: (value) => resetPasswordStore.emailError,
                  onChanged: resetPasswordStore.setEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    label: const Text("Insira seu e-mail"),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(builder: (_) {
                  return ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await resetPasswordStore
                            .resetPassword(
                          resetPasswordStore.email,
                        )
                            .then(
                          (value) {
                            if (value) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, AppRoutes.LOGIN, (route) => false);
                            }
                          },
                        );
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 70, right: 70),
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
