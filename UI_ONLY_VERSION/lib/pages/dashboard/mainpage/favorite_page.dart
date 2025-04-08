import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/favorites/favorite_item.dart';
import 'package:ichwan_shoe_market/theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int countFavorite = 1;

  @override
  Widget build(BuildContext context) {
    // * AppBar
    PreferredSizeWidget appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(87),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: bgColor1,
          centerTitle: true,
          flexibleSpace: SafeArea(
              child: Container(
                  height: 87,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Favorite Shoes',
                        style: textStyle.copyWith(
                            color: primaryTextColor,
                            fontSize: 20,
                            fontWeight: semiBold),
                      ),
                    ],
                  ))),
        ),
      );
    }

    // * EMPTY FAVORITE
    Widget emptyFavorite() {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/LoveIcon.png', width: 80),
          const SizedBox(
            height: 20,
          ),
          Text(
            'You don\'t have dream shoes?',
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

    // * FAVORITE ITEM
    Widget favoriteItem() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            FavoriteItem(),
            FavoriteItem(),
            FavoriteItem(),
            FavoriteItem(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: appBar(),
      body: countFavorite > 0 ? favoriteItem() : emptyFavorite(),
    );
  }
}
