import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/product_detail_page.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:intl/intl.dart';

class PopularProduct extends StatelessWidget {
  final ProductModel popularProduct;

  const PopularProduct({super.key, required this.popularProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailPage(product: popularProduct))),
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        width: 215,
        height: 278,
        decoration: BoxDecoration(
          color: bgCard,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  '$imageUrl${popularProduct.coverImage}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      popularProduct.category,
                      style: textStyle.copyWith(
                        color: placeholderTextColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      popularProduct.productName,
                      style: textStyle.copyWith(
                        color: cardTextColor,
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\IDR ${NumberFormat.decimalPattern().format(popularProduct.price)}',
                      style: textStyle.copyWith(
                        color: priceColor,
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
