import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ichwan_shoe_market/theme.dart';

class NewArrivalsProduct extends StatelessWidget {
  const NewArrivalsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: bgCard,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/exshoes.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hiking',
                  style: textStyle.copyWith(
                      color: placeholderTextColor, fontSize: 14),
                ),
                Text(
                  'Predator 20.3 Firm Ground',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 18,
                      fontWeight: semiBold),
                ),
                Text(
                  '\$58,67',
                  style: textStyle.copyWith(
                      color: priceColor, fontSize: 14, fontWeight: medium),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
