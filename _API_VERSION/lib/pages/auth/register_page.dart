import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/services/auth_service.dart';
import 'package:ichwan_shoe_market/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool _isShowingSnackBar = false;
  bool _isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
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
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              color: primaryTextColor,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Register Page',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 26,
                      fontWeight: semiBold)),
              const SizedBox(
                height: 5,
              ),
              Text('Register and Happy Shoping',
                  style: textStyle.copyWith(
                      color: secondaryTextColor,
                      fontSize: 16,
                      fontWeight: regular)),
            ],
          ),
        ],
      );
    }

    Widget registerButton() {
      return GestureDetector(
        onTap: () async {
          if (!_isShowingSnackBar && !_isLoading) {
            if (fullNameController.text == '' ||
                usernameController.text == '' ||
                emailController.text == '' ||
                passwordController.text == '') {
              showAppSnackBar('Please fill all the fields', alertColor);
              return;
            }

            if (!emailController.text.contains('@')) {
              showAppSnackBar('Email tidak valid', alertColor);
              return;
            }

            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Confirm Registration'),
                content: const Text(
                    'Are you sure you want to register with this information?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Register'),
                  ),
                ],
              ),
            );

            if (confirm != true) {
              return;
            }

            setState(() {
              _isLoading = true;
            });

            final authService = AuthService();

            final result = await authService.register(
                fullName: fullNameController.text,
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text);

            final bool status = result?['status'];
            final String message = result?['message'];

            showAppSnackBar(message, status ? Colors.green : alertColor);
            if (status) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login-page', (route) => false);

              return;
            }

            setState(() {
              _isLoading = false;
            });
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: _isLoading ? primaryColor.withOpacity(0.5) : primaryColor,
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
                    'Register',
                    style: textStyle.copyWith(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: semiBold),
                  ),
          ),
        ),
      );
    }

    Widget registerForm() {
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
                    Text('Full Name',
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
                            'assets/icons/Username_Icon.png',
                            width: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: fullNameController,
                              style: textStyle.copyWith(
                                  color: primaryTextColor,
                                  fontSize: 16,
                                  fontWeight: medium),
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Your Full Name',
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
              margin: const EdgeInsets.only(bottom: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username',
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
                            'assets/icons/Union-2.png',
                            width: 25,
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
                                  hintText: 'Your Username',
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
                              controller: emailController,
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

            // REGISTER BUTTON
            registerButton(),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: textStyle.copyWith(
                  color: placeholderTextColor,
                  fontSize: 14,
                  fontWeight: medium),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/login-page'),
              child: Text(
                'Login Here',
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
          children: [
            header(),
            registerForm(),
            footer(),
          ],
        ),
      ),
    );
  }
}
