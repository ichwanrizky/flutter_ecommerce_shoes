import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/models/user_model.dart';
import 'package:ichwan_shoe_market/providers/auth_provider.dart';
import 'package:ichwan_shoe_market/services/auth_service.dart';
import 'package:ichwan_shoe_market/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool _isShowingSnackBar = false;
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    Widget loginButton() {
      return GestureDetector(
        onTap: () async {
          if (!_isShowingSnackBar && !_isLoading) {
            if (usernameController.text == '' ||
                passwordController.text == '') {
              showAppSnackBar('Please fill all the fields', alertColor);
              return;
            }

            setState(() {
              _isLoading = true;
            });

            final authService = AuthService();
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);

            final result = await authService.login(
              username: usernameController.text,
              password: passwordController.text,
            );

            final bool status = result?['status'];
            final String message = result?['message'];

            showAppSnackBar(
              message,
              status ? Colors.green : alertColor,
            );

            if (status) {
              final UserModel user = result?['user'];
              await authProvider.login(user);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main-page', (route) => false);
            }

            setState(() {
              _isLoading = false;
            });
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: _isLoading ? primaryColor.withOpacity(0.2) : primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: _isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please Wait ...',
                        style: textStyle.copyWith(
                            color: primaryTextColor.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: semiBold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: primaryTextColor.withOpacity(0.5),
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Login',
                    style: textStyle.copyWith(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: semiBold),
                  ),
          ),
        ),
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
                    Text('Email / Username',
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
                              controller: usernameController,
                              style: textStyle.copyWith(
                                  color: primaryTextColor,
                                  fontSize: 16,
                                  fontWeight: medium),
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Your Email / Username',
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
                              controller: passwordController,
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
            loginButton()
          ],
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: textStyle.copyWith(
                color: placeholderTextColor, fontSize: 14, fontWeight: medium),
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
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: ListView(
            children: [
              header(),
              loginForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
