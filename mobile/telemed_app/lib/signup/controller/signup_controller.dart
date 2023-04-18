import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telemed_app/signup/model/signup_model.dart';

class SignUpController {
  static const _baseUrl = 'http://192.168.0.101:8080/api';
  static Future<SignUpModel> signUp(
      String? email, String? password, String? name) async {
    if (email == null && name == null && password == null) {
      throw Exception("Null params exception");
    }
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode != 200) {
      final parseBody = jsonDecode(response.body);
      throw Exception(parseBody['error']);
    }
    return SignUpModel(email: email, name: name);
  }
}
