import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:telemed_app/controllers/sigin_controller.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  String name = '';
  @observable
  String? error;
  @action
  setName(String value) => name = value;
  @observable
  String phone = '';
  @action
  setPhone(String value) => phone = value;
  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;
  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;
  @observable
  bool showPassword = false;

  @observable
  bool isLoggedIn = false;
  @action
  void toggleShowPassword() => showPassword = !showPassword;
  @action
  void loggout() {
    isLoggedIn = false;
    email = '';
    password = '';
  }

  @observable
  bool loading = false;

  @computed
  bool get isLoading => loading;
  @computed
  bool get isEmailValid => email.isNotEmpty && email.contains('@');

  @computed
  bool get isPasswordValid => password.isNotEmpty && password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
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
    if (!isEmailValid) {
      return 'Insira um email válido';
    } else {
      return null;
    }
  }

  @computed
  String? get phoneError {
    final regex = RegExp(r'([0-9]{2,3})?(\([0-9]{2}\))([0-9]{4,5})([0-9]{4})');
    if (regex.hasMatch(phone)) {
      return 'Insira um telefone válido';
    } else {
      return null;
    }
  }

  @action
  Future<void> register() async {
    try {
      await SignInController.registerUser(email, password, name);
    } catch (e) {
      error = e.toString();
    }
  }

  @action
  Future<void> login() async {
    try {
      await SignInController.login(email, password);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }
}
