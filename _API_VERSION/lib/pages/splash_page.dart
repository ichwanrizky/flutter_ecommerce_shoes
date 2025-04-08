import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login-page', (route) => false);
    });
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
