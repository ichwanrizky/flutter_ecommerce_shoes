import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> login(UserModel user) async {
    _user = user;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.accessToken);

    final userJson = jsonEncode(user);
    await prefs.setString('user', userJson);

    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');

    if (userData != null) {
      final userMap = jsonDecode(userData);
      _user = UserModel.fromJson(userMap);
      notifyListeners();
    }
  }
}
