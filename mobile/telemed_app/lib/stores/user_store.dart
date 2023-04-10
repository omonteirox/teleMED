import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
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

  @computed
  bool get isEmailValid => email.isNotEmpty && email.contains('@');

  @computed
  bool get isPasswordValid => password.isNotEmpty && password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
  void login() {
    isLoggedIn = true;
  }
}
