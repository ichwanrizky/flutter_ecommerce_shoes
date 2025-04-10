import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/providers/auth_provider.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('token');

    final token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 2));

    if (token != null && token.isNotEmpty) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.loadUserFromPrefs();

      Navigator.pushNamedAndRemoveUntil(
          context, '/main-page', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login-page',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
          width: 130,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
