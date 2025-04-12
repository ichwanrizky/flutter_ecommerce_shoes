import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/product_detail_page.dart';
import 'package:ichwan_shoe_market/theme.dart';

class FamiliarProducts extends StatelessWidget {
  final ProductModel product;
  const FamiliarProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailPage(productId: product.id))),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: bgCard,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              '$imageUrl${product.coverImage}',
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        ),
      ),
    );
  }
}
