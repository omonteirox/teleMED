import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class SignInController {
  static const _baseUrl = 'http://localhost:8080/api/auth';
  static Future<User> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to register user');
    }
  }
}
