import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // * AppBar
    PreferredSizeWidget appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(87),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          backgroundColor: bgColor1,
          flexibleSpace: SafeArea(
            child: Container(
              height: 87,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/profileichwan.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Ichwan',
                              style: textStyle.copyWith(
                                  color: primaryTextColor,
                                  fontSize: 22,
                                  fontWeight: semiBold)),
                          Text('@ichwanrizky',
                              style: textStyle.copyWith(
                                  color: secondaryTextColor,
                                  fontSize: 14,
                                  fontWeight: regular)),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false),
                      child: Text(
                        'Logout',
                        style: textStyle.copyWith(
                            color: alertColor,
                            fontSize: 14,
                            fontWeight: semiBold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    // * ACCOUNT
    Widget accountSetting() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: textStyle.copyWith(
                color: primaryTextColor, fontSize: 18, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Edit Profile',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Your Orders',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Help',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
        ],
      );
    }

    // * General
    Widget generalSetting() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: textStyle.copyWith(
                color: primaryTextColor, fontSize: 18, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Privacy & Policy',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Term of Service',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rate App',
                  style: textStyle.copyWith(
                      color: placeholderTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 30,
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
        backgroundColor: bgColor3,
        appBar: appBar(),
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              accountSetting(),
              SizedBox(
                height: 30,
              ),
              generalSetting()
            ],
          ),
        ));
  }
}
