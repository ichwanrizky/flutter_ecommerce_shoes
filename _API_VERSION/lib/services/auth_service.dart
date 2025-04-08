import 'dart:convert';

import 'package:ichwan_shoe_market/constant.dart';

import 'package:http/http.dart' as http;
import 'package:ichwan_shoe_market/models/user_model.dart';

class AuthService {
  Future<UserModel?> login(
      {required String username, required String password}) async {
    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return UserModel.fromJson(body['data']);
    }

    return null;
  }
}
