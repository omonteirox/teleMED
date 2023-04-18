import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  final storage = FlutterSecureStorage();

  Future<bool> readRemember() async {
    final rememberString = await storage.read(key: 'rememberPassword');
    return rememberString != null
        ? rememberString.toLowerCase() == 'true'
        : false;
  }

  Future<void> saveRemember(bool value) async {
    try {
      await storage.write(key: 'rememberPassword', value: value.toString());
    } catch (e) {
      throw Exception("Erro ao salvar o remember");
    }
  }

  Future<void> savePassword(String? password) async {
    if (password != null && password.isNotEmpty) {
      await storage.write(key: 'password', value: password);
    }
  }

  Future<String> readPassword() async {
    final userPassword = await storage.read(key: 'password');
    return userPassword ?? '';
  }

  Future<void> saveData(
      String? email, String? password, bool rememberPassword) async {
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    await storage.write(key: 'isLogged', value: rememberPassword.toString());
  }
}
