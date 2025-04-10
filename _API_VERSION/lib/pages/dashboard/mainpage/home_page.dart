import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/newarrivalsproduct.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/popularproduct.dart';
import 'package:ichwan_shoe_market/providers/auth_provider.dart';
import 'package:ichwan_shoe_market/services/product_service.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCategories = 'all';

  final listCategories = [
    {'key': 'all', 'value': 'All Shoes'},
    {'key': 'running', 'value': 'Running'},
    {'key': 'training', 'value': 'Training'},
    {'key': 'basket', 'value': 'Basketball'},
    {'key': 'footbal', 'value': 'Football'},
  ];

  List<ProductModel> _popularProducts = [];
  bool _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchProduct();
  // }

  // Future<void> fetchProduct() async {
  //   final productService = ProductServices();
  //   final result = await productService.getProducts();
  //   if (result?['status']) {
  //     List<ProductModel> data = result?['products'];
  //     setState(() {
  //       _popularProducts = data;
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final productService = ProductServices();
    final user = authProvider.user;
    Widget header() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, ${user?.name}',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 26,
                      fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('@${user?.username}',
                    style: textStyle.copyWith(
                        color: secondaryTextColor,
                        fontSize: 16,
                        fontWeight: regular)),
              ],
            ),
          ),
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/profileichwan.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    }

    // * CATEGORIES
    Widget categories() {
      return Container(
        margin: const EdgeInsets.only(top: 35),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listCategories.map((e) {
              final isActive = currentCategories == e['key'];

              return GestureDetector(
                onTap: () => setState(() {
                  currentCategories = e['key']!;
                }),
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      color: isActive ? primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isActive
                            ? Colors.transparent
                            : placeholderTextColor,
                      )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    e['value']!,
                    style: textStyle.copyWith(
                        fontSize: 14,
                        color:
                            isActive ? primaryTextColor : placeholderTextColor),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    // * POPULAR PRODUCTS
    Widget popularProducts() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Popular Products',
            style: textStyle.copyWith(
                fontSize: 22, color: primaryTextColor, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: productService.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final result = snapshot.data;

                if (result?['status']) {
                  List<ProductModel> data = result?['products'];

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: data
                            .map((e) => PopularProduct(popularProduct: e))
                            .toList()),
                  );
                } else {
                  return Text(
                    '${result?['message']}',
                    style: textStyle.copyWith(fontSize: 16, color: alertColor),
                    textAlign: TextAlign.left,
                  );
                }
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // loop manual 4
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Shimmer.fromColors(
                            baseColor: const Color(
                                0xFFF6F6F6), // abu gelap (gelap banget)
                            highlightColor: const Color(0xFFE0E0E0),
                            child: Container(
                              margin: const EdgeInsets.only(right: 30),
                              width: 215,
                              height: 278,
                              decoration: BoxDecoration(
                                color: bgCard,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ), // Shimmer highlight color
                          )),
                ),
              );
            },
          )
        ],
      );
    }

    // * NEW ARRIVALS PRODUCTS
    Widget newArrivalsProducts() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'New Arrivals',
            style: textStyle.copyWith(
                fontSize: 22, color: primaryTextColor, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          NewArrivalsProduct(),
          NewArrivalsProduct(),
          NewArrivalsProduct(),
          NewArrivalsProduct(),
          NewArrivalsProduct(),
          NewArrivalsProduct(),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(30),
      child: ListView(
        children: [
          header(),
          categories(),
          popularProducts(),
          newArrivalsProducts()
        ],
      ),
    );
  }
}
