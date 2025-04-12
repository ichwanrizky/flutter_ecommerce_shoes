import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/familiarproducts.dart';
import 'package:ichwan_shoe_market/services/product_service.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isShowingSnackBar = false;

  late Future<Map<String, dynamic>?> _similarProducts;
  late Future<Map<String, dynamic>?> _productDetail;

  ProductModel? _product;

  void showAppSnackBar(String message, Color color) {
    if (!_isShowingSnackBar) {
      _isShowingSnackBar = true;

      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: color,
              duration: const Duration(milliseconds: 800),
            ),
          )
          .closed
          .then((_) {
        if (mounted) {
          setState(() {
            _isShowingSnackBar = false;
          });
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productDetail = ProductServices().getDetailProduct(widget.productId);
    _productDetail.then((result) {
      if (result?['status']) {
        setState(() {
          _product = result?['product'];
          _similarProducts = ProductServices().getSimilarProduct(
            _product?.category,
            _product?.id,
          );
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAppSnackBar(result?['message'], alertColor);
          Navigator.pop(context, true);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productService = ProductServices();

    // * TOP CONTENT
    Widget topContent(String coverImage) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(color: bgCard),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                '$imageUrl$coverImage',
                fit: BoxFit.cover,
                alignment: const Alignment(0, 2),
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, true),
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
            ),
          ],
        ),
      );
    }

    Widget bottomContent(
      int id,
      String productName,
      String category,
      int price,
      bool? favorites,
    ) {
      return Container(
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
                        Text(productName,
                            style: textStyle.copyWith(
                                fontSize: 18,
                                color: primaryTextColor,
                                fontWeight: semiBold)),
                        Text(category,
                            style: textStyle.copyWith(
                                fontSize: 14,
                                color: placeholderTextColor,
                                fontWeight: medium)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!_isShowingSnackBar) {
                        final result = await productService.handleFavorite(id);

                        final bool status = result?['status'];
                        final String message = result?['message'];

                        showAppSnackBar(
                            message, status ? Colors.green : alertColor);

                        if (status) {
                          setState(() {
                            _product!.favorites =
                                !(_product!.favorites ?? false);
                          });
                        }
                      }
                    },
                    child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                            color: favorites == true
                                ? secondaryColor
                                : const Color(0xff423F53),
                            shape: BoxShape.circle),
                        child: Icon(Icons.favorite,
                            color: favorites == true
                                ? primaryTextColor
                                : bgColor1)),
                  )
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
                    'IDR ${NumberFormat.decimalPattern().format(price)}',
                    style: textStyle.copyWith(
                        fontSize: 16, color: priceColor, fontWeight: semiBold),
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
                      future: _similarProducts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
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
      );
    }

    return Scaffold(
        backgroundColor: bgColor3,
        body: _product == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  topContent(_product!.coverImage),
                  bottomContent(_product!.id, _product!.productName,
                      _product!.category, _product!.price, _product!.favorites)
                ],
              ));
  }
}
