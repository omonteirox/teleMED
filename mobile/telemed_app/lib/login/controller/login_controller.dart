import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  static const _baseUrl = 'http://192.168.0.101:8080/api';
  static Future<void> loginWithEmail(String? email, String? password) async {
    if (email == null && password == null) {
      throw Exception("Null params exception");
    }
    final response = await http
        .post(
      Uri.parse('$_baseUrl/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String?, String?>{
        'email': email,
        'password': password,
      }),
    )
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw Exception('Tempo Limite excedido');
      },
    );
    if (response.statusCode != 200) {
      final parseBody = jsonDecode(response.body);
      throw Exception(parseBody['error']);
    }
  }
}
