import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ichwan_shoe_market/theme.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      width: 215,
      height: 278,
      decoration:
          BoxDecoration(color: bgCard, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/exshoes.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hiking',
                  style: textStyle.copyWith(
                      color: placeholderTextColor, fontSize: 14),
                ),
                Text(
                  'COURT VISION 2.0',
                  style: textStyle.copyWith(
                      color: cardTextColor, fontSize: 18, fontWeight: semiBold),
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
