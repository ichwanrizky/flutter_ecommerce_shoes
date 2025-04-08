import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ichwan_shoe_market/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login Page',
              style: textStyle.copyWith(
                  color: primaryTextColor, fontSize: 26, fontWeight: semiBold)),
          const SizedBox(
            height: 5,
          ),
          Text('Sign In to Countinue',
              style: textStyle.copyWith(
                  color: secondaryTextColor,
                  fontSize: 16,
                  fontWeight: regular)),
        ],
      );
    }

    Widget loginForm() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        style: textStyle.copyWith(
                            color: primaryTextColor,
                            fontSize: 18,
                            fontWeight: medium)),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bgColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/Email_Icon.png',
                            width: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: null,
                              style: textStyle.copyWith(
                                  color: primaryTextColor,
                                  fontSize: 16,
                                  fontWeight: medium),
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Your Email Address',
                                  hintStyle: textStyle.copyWith(
                                      color: placeholderTextColor,
                                      fontSize: 16,
                                      fontWeight: medium)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password',
                        style: textStyle.copyWith(
                            color: primaryTextColor,
                            fontSize: 18,
                            fontWeight: medium)),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bgColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/Password_Icon.png',
                            width: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: null,
                              style: textStyle.copyWith(
                                  color: primaryTextColor,
                                  fontSize: 16,
                                  fontWeight: medium),
                              obscureText: true,
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Your Password',
                                  hintStyle: textStyle.copyWith(
                                      color: placeholderTextColor,
                                      fontSize: 16,
                                      fontWeight: medium)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),

            // * LOGIN BUTTON
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/main-page'),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    'Login',
                    style: textStyle.copyWith(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: semiBold),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: textStyle.copyWith(
                  color: placeholderTextColor,
                  fontSize: 14,
                  fontWeight: medium),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/register-page'),
              child: Text(
                'Register Here',
                style: textStyle.copyWith(
                    color: primaryColor, fontSize: 14, fontWeight: semiBold),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: ListView(
          children: [header(), loginForm()],
        ),
      ),
      bottomNavigationBar: footer(),
    );
  }
}
