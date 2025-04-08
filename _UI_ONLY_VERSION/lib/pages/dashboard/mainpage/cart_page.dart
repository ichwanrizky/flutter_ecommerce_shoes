import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/theme.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int countCart = 2;
  int countItem = 2;

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
                  height: 87,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Your Cart',
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

    // * EMPTY CART
    Widget emptyCart() {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/Carticon2.png', width: 80),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Opss! Your Cart is Empty',
            style: textStyle.copyWith(
                color: primaryTextColor, fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'Let\'s find your favorite shoes',
            style: textStyle.copyWith(
                color: placeholderTextColor, fontSize: 14, fontWeight: regular),
          ),
          const SizedBox(
            height: 21,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/main-page', (route) => false,
                arguments: 0),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Text(
                'Explore Store',
                style: textStyle.copyWith(
                    color: primaryTextColor, fontSize: 16, fontWeight: medium),
              ),
            ),
          )
        ],
      ));
    }

    // * CART
    Widget cart() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: ListView(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: bgNavbar, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Row(
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
                                color: priceColor,
                                fontSize: 16,
                                fontWeight: regular),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: const Icon(Icons.add,
                                color: primaryTextColor, size: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$countCart',
                          style: textStyle.copyWith(
                            color: primaryTextColor,
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: Color(0xff3F4251),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.remove,
                                color: primaryTextColor, size: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.delete, color: alertColor),
                    Text('Remove',
                        style:
                            textStyle.copyWith(color: alertColor, fontSize: 14))
                  ],
                )
              ],
            ),
          )
        ]),
      );
    }

    // * PROCESS TO CHECKOUT
    Widget processCheckout() {
      return Container(
          margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                    'Subtotal',
                    style: textStyle.copyWith(
                        fontSize: 14,
                        color: primaryTextColor,
                        fontWeight: medium),
                  ),
                ),
                Text(
                  '\$287,96',
                  style: textStyle.copyWith(
                      fontSize: 16, color: priceColor, fontWeight: semiBold),
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/checkout-page'),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Continue to Checkout',
                          style: textStyle.copyWith(
                              fontSize: 16,
                              color: primaryTextColor,
                              fontWeight: semiBold),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: primaryTextColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor3,
        appBar: appBar(),
        body: countCart == 0 ? emptyCart() : cart(),
        bottomNavigationBar: countCart > 0 ? processCheckout() : const Text(''),
      ),
    );
  }
}
