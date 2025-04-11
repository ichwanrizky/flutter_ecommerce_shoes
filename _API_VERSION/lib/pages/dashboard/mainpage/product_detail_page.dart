import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/familiarproducts.dart';
import 'package:ichwan_shoe_market/services/product_service.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final productService = ProductServices();

    return Scaffold(
        body: Stack(
      children: [
        // * TOP CONTENT
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(color: bgCard),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  '$imageUrl${widget.product.coverImage}',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, 2),
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/CartIcon3.png',
                      width: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        // * BOTTOM CONTENT
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 300),
          height: double.infinity,
          decoration: const BoxDecoration(
              color: bgColor1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.productName,
                              style: textStyle.copyWith(
                                  fontSize: 18,
                                  color: primaryTextColor,
                                  fontWeight: semiBold)),
                          Text(widget.product.category,
                              style: textStyle.copyWith(
                                  fontSize: 14,
                                  color: placeholderTextColor,
                                  fontWeight: medium)),
                        ],
                      ),
                    ),
                    Container(
                        width: 46,
                        height: 46,
                        decoration: const BoxDecoration(
                            color: Color(0xff423F53), shape: BoxShape.circle),
                        child: const Icon(Icons.favorite, color: bgColor1))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: bgColor2, borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    Text(
                      'Price starts from',
                      style: textStyle.copyWith(
                          fontSize: 14,
                          color: primaryTextColor,
                          fontWeight: medium),
                    ),
                    const Spacer(),
                    Text(
                      'IDR ${NumberFormat.decimalPattern().format(widget.product.price)}',
                      style: textStyle.copyWith(
                          fontSize: 16,
                          color: priceColor,
                          fontWeight: semiBold),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Description',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 16,
                      fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 14,
                      fontWeight: regular),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Fimiliar Shoes',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 16,
                      fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                        future: productService.getSimilarProduct(
                            widget.product.category, widget.product.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final result = snapshot.data;

                            if (result?['status']) {
                              List<ProductModel> data = result?['products'];

                              if (data.isEmpty) {
                                return Text(
                                  'Product is empty',
                                  style: textStyle.copyWith(
                                      fontSize: 16, color: alertColor),
                                  textAlign: TextAlign.left,
                                );
                              }

                              return Row(
                                children: data
                                    .map((e) => FamiliarProducts(
                                          product: e,
                                        ))
                                    .toList(),
                              );
                            } else {
                              return Text(
                                '${result?['message']}',
                                style: textStyle.copyWith(
                                    fontSize: 16, color: alertColor),
                                textAlign: TextAlign.left,
                              );
                            }
                          }

                          return Shimmer.fromColors(
                            baseColor: const Color(
                                0xFFF6F6F6), // abu gelap (gelap banget)
                            highlightColor:
                                const Color.fromARGB(255, 184, 180, 180),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: bgCard,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ), // Shimmer highlight color
                          );
                        })),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: primaryColor)),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        'assets/icons/ChatIcon.png',
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text('Add to Cart',
                                style: textStyle.copyWith(
                                    color: primaryTextColor,
                                    fontSize: 18,
                                    fontWeight: semiBold)),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
