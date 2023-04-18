import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:telemed_app/login/controller/login_controller.dart';
import 'package:telemed_app/utils/secure/secure.dart';
import 'package:telemed_app/utils/animations/loading_dialog.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final secureStorage = SecureData();
  final LoadingDialog dialog = LoadingDialogImpl();
  final TextEditingController passwordController = TextEditingController();
  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;
  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;
  @observable
  bool rememberPassword = false;
  @action
  setRememberPassword(bool value) => rememberPassword = value;
  @observable
  String? error;
  setError(String? value) => error = value;
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
  savePassword(String? value) async {
    if (rememberPassword) {
      try {
        await secureStorage.savePassword(value);
      } catch (e) {
        setError(e.toString());
      }
    } else {
      setPassword(value!);
      return;
    }
  }

  @action
  Future<void> readRemember() async {
    try {
      bool result = await secureStorage.readRemember();
      setRememberPassword(result);
      return;
    } catch (e) {
      return;
    }
  }

  @action
  Future<void> saveRemember(bool remember) async {
    try {
      await secureStorage.saveRemember(remember);
    } catch (e) {
      return;
    }
  }

  @action
  Future<String> readPassword() async {
    if (rememberPassword) {
      try {
        String result = await secureStorage.readPassword();
        setPassword(result);
        return result;
      } catch (e) {
        return "";
      }
    } else {
      return "";
    }
  }

  @action
  Future<void> loginWithEmail(
      String? email, String? password, bool rememberPassword) async {
    dialog.show();
    await Future.delayed(const Duration(seconds: 1));
    try {
      await LoginController.loginWithEmail(email, password);
      await secureStorage.saveData(email, password, rememberPassword);
      await dialog.hide();
    } catch (e) {
      setError(e.toString());
      Asuka.showSnackBar(SnackBar(content: Text(error!)));
      await dialog.hide();
    }
  }

  _LoginStoreBase() {
    autorun((_) async {
      try {
        readRemember();
        if (rememberPassword) {
          readPassword();
          passwordController.text = password;
        }
      } catch (e) {
        return;
      }
    });
  }
}
