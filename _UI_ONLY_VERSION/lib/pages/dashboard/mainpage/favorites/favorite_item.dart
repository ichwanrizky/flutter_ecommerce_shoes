import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/theme.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: bgNavbar, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: bgCard,
                  borderRadius: BorderRadius.circular(12),
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
                      'Predator 20.3 Firm Ground',
                      style: textStyle.copyWith(
                          color: primaryTextColor,
                          fontSize: 16,
                          fontWeight: semiBold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$58,67',
                      style: textStyle.copyWith(
                          color: priceColor, fontSize: 16, fontWeight: regular),
                    )
                  ],
                ),
              ),
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                    color: secondaryColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
