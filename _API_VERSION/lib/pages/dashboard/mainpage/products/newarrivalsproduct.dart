import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:intl/intl.dart';

class NewArrivalsProduct extends StatelessWidget {
  final ProductModel newArrivalsProduct;

  const NewArrivalsProduct({super.key, required this.newArrivalsProduct});

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$imageUrl${newArrivalsProduct.coverImage}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              )),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newArrivalsProduct.category,
                  style: textStyle.copyWith(
                      color: placeholderTextColor, fontSize: 14),
                ),
                Text(
                  newArrivalsProduct.productName,
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 18,
                      fontWeight: semiBold),
                ),
                Text(
                  'IDR ${NumberFormat.decimalPattern().format(newArrivalsProduct.price)}',
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
