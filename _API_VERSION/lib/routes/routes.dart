import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/auth/login_page.dart';
import 'package:ichwan_shoe_market/pages/auth/register_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/main_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/cart/checkout_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/cart_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/product_detail_page.dart';
import 'package:ichwan_shoe_market/pages/splash_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/login-page':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register-page':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/main-page':
        final int index = settings.arguments as int? ?? 0;
        return MaterialPageRoute(builder: (_) => MainPage(initialIndex: index));
      case '/cart-page':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/checkout-page':
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
