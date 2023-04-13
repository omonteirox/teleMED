import 'package:mobx/mobx.dart';
import 'package:telemed_app/secure/secure.dart';
import 'package:telemed_app/stores/user_store.dart';

import '../controllers/sigin_controller.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final secureStorage = SecureData();
  @observable
  String? error;
  @action
  setError(String? value) => value = error;
  @observable
  bool loading = false;
  @computed
  bool get isLoading => loading;

  @action
  Future<void> register(UserStore store) async {
    try {
      await SignInController.registerUser(
          store.email, store.password, store.name);
    } catch (e) {
      error = e.toString();
    }
  }

  @action
  Future<void> login(UserStore store) async {
    try {
      await SignInController.login(store.email, store.password);
      await secureStorage.saveData(
          store.email, store.password, store.rememberPassword);
      store.isLoggedIn = true;
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }
}
