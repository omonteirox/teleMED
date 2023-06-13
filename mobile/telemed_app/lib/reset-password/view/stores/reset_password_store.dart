import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'reset_password_store.g.dart';

class ResetPasswordStore = _ResetPasswordBase with _$ResetPasswordStore;

abstract class _ResetPasswordBase with Store {
  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;
  @observable
  String? error;
  setError(String? value) => error = value;
  @computed
  bool get isEmailValid => email.isNotEmpty && email.contains('@');

  @computed
  String? get emailError {
    if (isEmailValid) {
      return null;
    } else {
      return 'Insira um email válido';
    }
  }

  @action
  Future<bool> resetPassword(String? email) async {
    // dialog.show();
    await Future.delayed(const Duration(seconds: 1));
    try {
      return true;
      // await dialog.hide();
    } catch (e) {
      setError(e.toString());
      return false;
      // Asuka.showSnackBar(SnackBar(content: Text(error!)));
      // await dialog.hide();
    }
  }
}
