import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/cart/list_item_checkout.dart';
import 'package:ichwan_shoe_market/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // * APP BAR
    PreferredSizeWidget appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(87),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor1,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: SafeArea(
              child: Container(
                  height: 87, // Jaga tinggi
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Checkout Details',
                        style: textStyle.copyWith(
                            color: primaryTextColor,
                            fontSize: 20,
                            fontWeight: semiBold),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.chevron_left,
                            color: primaryTextColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ))),
        ),
      );
    }

    // * LIST ITEMS
    Widget listItems() {
      return Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('List Items',
                style: textStyle.copyWith(
                    fontSize: 16,
                    color: primaryTextColor,
                    fontWeight: semiBold)),
            const SizedBox(
              height: 15,
            ),
            ListItemsCheckout(),
            ListItemsCheckout(),
          ],
        ),
      );
    }

    // * ADDRESS
    Widget address() {
      return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: bgNavbar, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Address Details',
                style: textStyle.copyWith(
                    fontSize: 16,
                    color: primaryTextColor,
                    fontWeight: semiBold)),
            const SizedBox(
              height: 14,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color(0xff2F3344), shape: BoxShape.circle),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/icons/BuildingIcon.png',
                      width: 20,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/Line1.png',
                    height: 50,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color(0xff2F3344), shape: BoxShape.circle),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/icons/Location.png',
                      width: 20,
                    ),
                  ),
                ]),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Store Location',
                      style: textStyle.copyWith(
                          fontSize: 12,
                          color: placeholderTextColor,
                          fontWeight: regular),
                    ),
                    Text(
                      'Adidas Core',
                      style: textStyle.copyWith(
                          fontSize: 16,
                          color: primaryTextColor,
                          fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Your Address',
                      style: textStyle.copyWith(
                          fontSize: 12,
                          color: placeholderTextColor,
                          fontWeight: regular),
                    ),
                    Text(
                      'Batam',
                      style: textStyle.copyWith(
                          fontSize: 16,
                          color: primaryTextColor,
                          fontWeight: medium),
                    )
                  ],
                )
              ],
            ),
          ]));
    }

    // * PAYMENT SUMMARY
    Widget paymentSummary() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            color: bgNavbar, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Payment Summary',
              style: textStyle.copyWith(
                  fontSize: 16, color: primaryTextColor, fontWeight: semiBold)),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Product Quantity',
                    style: textStyle.copyWith(
                        color: placeholderTextColor, fontSize: 12),
                  ),
                ),
                Text(
                  '2 Items',
                  style:
                      textStyle.copyWith(color: primaryTextColor, fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Product Price',
                    style: textStyle.copyWith(
                        color: placeholderTextColor, fontSize: 12),
                  ),
                ),
                Text(
                  '\$575.92',
                  style:
                      textStyle.copyWith(color: primaryTextColor, fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shipping',
                    style: textStyle.copyWith(
                        color: placeholderTextColor, fontSize: 12),
                  ),
                ),
                Text(
                  'Free',
                  style:
                      textStyle.copyWith(color: primaryTextColor, fontSize: 14),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total',
                    style: textStyle.copyWith(
                        color: priceColor, fontSize: 14, fontWeight: semiBold),
                  ),
                ),
                Text(
                  '\$575.92',
                  style: textStyle.copyWith(
                      color: priceColor, fontSize: 14, fontWeight: semiBold),
                )
              ],
            ),
          )
        ]),
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor3,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [listItems(), address(), paymentSummary()],
        ),
      ),
    ));
  }
}
