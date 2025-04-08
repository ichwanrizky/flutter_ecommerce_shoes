import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/products/familiarproducts.dart';
import 'package:ichwan_shoe_market/theme.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(color: bgCard),
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/CartIcon3.png',
                      width: 20,
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/exshoes.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 300),
            height: double.infinity,
            decoration: const BoxDecoration(
                color: bgColor1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
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
                            Text('TERREX URBAN LOW',
                                style: textStyle.copyWith(
                                    fontSize: 18,
                                    color: primaryTextColor,
                                    fontWeight: semiBold)),
                            Text('Hiking',
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
                        color: bgColor2,
                        borderRadius: BorderRadius.circular(5)),
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
                        '\$143,98',
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
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                        FamiliarProducts(),
                      ],
                    ),
                  ),
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
      )),
    );
  }
}
