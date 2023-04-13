import 'package:mobx/mobx.dart';
import 'package:telemed_app/stores/auth_store.dart';

import '../secure/secure.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final authStore = AuthStore();
  final _secureStorage = SecureData();
  @observable
  bool visiblePassword = true;
  @action
  setVisiblePassword(bool value) => visiblePassword = value;
  @observable
  String name = '';
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
  @observable
  bool rememberPassword = false;
  @action
  setRememberPassword(bool value) => rememberPassword = value;
  @action
  setPassword(String value) => password = value;
  @observable
  bool isLoggedIn = false;
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
  Future<bool> saveRemember() async {
    try {
      await _secureStorage.saveRemember(rememberPassword);
      return true;
    } catch (e) {}
    return false;
  }

  @action
  Future<bool> readRemember() async {
    try {
      rememberPassword = await _secureStorage.readRemember();
      return rememberPassword;
    } catch (e) {
      // todo
    }
    return false;
  }

  @action
  Future<void> savePassword() async {
    try {
      await _secureStorage.savePassword(password);
    } catch (e) {}
  }

  @action
  Future<String> readPassword() async {
    try {
      password = await _secureStorage.readPassword();
      print("readed password -> $password");
      return password;
    } catch (e) {
      // todo
    }
    return '';
  }

  _UserStoreBase() {
    autorun((_) async {
      try {
        readRemember();
        if (rememberPassword) {
          savePassword();
        }
      } catch (e) {}
    });
  }
}
