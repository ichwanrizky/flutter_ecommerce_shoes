import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/newarrivalsproduct.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/popularproduct.dart';
import 'package:ichwan_shoe_market/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hallo, Ichwan',
                    style: textStyle.copyWith(
                        color: primaryTextColor,
                        fontSize: 26,
                        fontWeight: semiBold)),
                const SizedBox(
                  height: 5,
                ),
                Text('@ichwanrizky',
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, '/product-detail-page'),
                  child: PopularProduct(),
                ),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
              ],
            ),
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
