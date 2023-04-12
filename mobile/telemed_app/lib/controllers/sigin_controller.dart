import 'dart:convert';

import 'package:http/http.dart' as http;

class SignInController {
  static const _baseUrl = 'http://192.168.0.113:8080/api';
  static Future<void> registerUser(
      String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode != 200) {
      final parseBody = jsonDecode(response.body);
      throw Exception(parseBody['error']);
    }
  }

  static Future<void> login(String email, String password) async {
    final response = await http
        .post(
      Uri.parse('$_baseUrl/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
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
