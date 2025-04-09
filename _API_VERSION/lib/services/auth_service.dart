import 'dart:convert';

import 'package:ichwan_shoe_market/constant.dart';

import 'package:http/http.dart' as http;
import 'package:ichwan_shoe_market/error.dart';
import 'package:ichwan_shoe_market/models/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>?> login(
      {required String username, required String password}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'password': password,
          }));

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {
          'status': true,
          'message': body['message'],
          'user': UserModel.fromJson(body['data']),
        };
      } else {
        return {
          'status': false,
          'message': body['message'] ?? 'Login gagal.',
        };
      }
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Map<String, dynamic>?> register({
    required String fullName,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'fullname': fullName,
            'username': username,
            'email': email,
            'password': password
          }));

      final body = jsonDecode(response.body);

      return {
        'status': body['status'],
        'message': body['message'],
      };
    } catch (e) {
      return handleError(e);
    }
  }
}
