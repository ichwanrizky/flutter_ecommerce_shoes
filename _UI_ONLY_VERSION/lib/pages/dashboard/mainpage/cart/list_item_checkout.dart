import 'package:flutter/cupertino.dart';
import 'package:ichwan_shoe_market/theme.dart';

class ListItemsCheckout extends StatelessWidget {
  const ListItemsCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgNavbar, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
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
          Text('2 Items',
              style: textStyle.copyWith(
                  color: primaryTextColor, fontSize: 14, fontWeight: medium))
        ],
      ),
    );
  }
}
