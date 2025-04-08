import 'package:flutter/cupertino.dart';
import 'package:ichwan_shoe_market/theme.dart';

class FamiliarProducts extends StatelessWidget {
  const FamiliarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: bgCard,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          'assets/images/exshoes.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
