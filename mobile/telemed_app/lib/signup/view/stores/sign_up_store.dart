import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:telemed_app/signup/controller/signup_controller.dart';
import 'package:telemed_app/utils/animations/loading_dialog.dart';
part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  final LoadingDialog dialog = LoadingDialogImpl();

  @observable
  String name = '';
  @action
  setName(String value) => name = value;
  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;
  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;
  @observable
  bool visiblePassword = true;
  @action
  setVisiblePassword(bool value) => visiblePassword = value;
  @computed
  bool get isEmailValid => email.isNotEmpty && email.contains('@');
  @computed
  bool get isPasswordValid => password.isNotEmpty && password.length >= 6;
  @computed
  String? get passwordError {
    if (isPasswordValid) {
      return null;
    } else {
      return 'Insira uma senha válida';
    }
  }

  @computed
  String? get emailError {
    if (isEmailValid) {
      return null;
    } else {
      return 'Insira um email válido';
    }
  }

  @action
  Future<bool> signUp(String? name, String? email, String? password) async {
    dialog.show();
    await Future.delayed(const Duration(seconds: 1));
    try {
      await SignUpController.signUp(email, password, name);
      await dialog.hide();
      await Future.delayed(const Duration(milliseconds: 500));
      Asuka.showSnackBar(
          const SnackBar(content: Text("Usuário criado com êxito")));
      return true;
    } catch (e) {
      Asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      await dialog.hide();
      return false;
    }
  }
}
