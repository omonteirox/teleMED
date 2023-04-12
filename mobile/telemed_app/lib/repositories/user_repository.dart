import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository {
  static const _baseUrl = 'http://192.168.0.113/api';
  static Future<void> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register user');
    }
  }
}
