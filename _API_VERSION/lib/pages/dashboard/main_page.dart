import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/chat_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/favorite_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/home_page.dart';
import 'package:ichwan_shoe_market/pages/dashboard/mainpage/profile_page.dart';
import 'package:ichwan_shoe_market/theme.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

  const MainPage({super.key, this.initialIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    Widget pages() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const FavoritePage();
        case 3:
          return const ProfilePage();
        default:
          return const Scaffold(body: Center(child: Text('Page not found')));
      }
    }

    return Scaffold(
      backgroundColor: bgColor3,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        shape: const StadiumBorder(),
        onPressed: () => Navigator.pushNamed(context, '/cart-page'),
        child: Image.asset(
          'assets/icons/CartIcon.png',
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 15,
          color: bgNavbar,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => setState(() {
              currentIndex = value;
            }),
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: SizedBox(
                      height: 26,
                      child: Image.asset(
                        'assets/icons/Home.png',
                        fit: BoxFit.contain,
                        color: currentIndex == 0
                            ? primaryColor
                            : secondaryTextColor,
                      ),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: SizedBox(
                      height: 26,
                      child: Image.asset(
                        'assets/icons/ChatIcon.png',
                        fit: BoxFit.contain,
                        color: currentIndex == 1
                            ? primaryColor
                            : secondaryTextColor,
                      ),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: SizedBox(
                      height: 26,
                      child: Image.asset(
                        'assets/icons/Union-3.png',
                        fit: BoxFit.contain,
                        color: currentIndex == 2
                            ? primaryColor
                            : secondaryTextColor,
                      ),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                      height: 28,
                      child: Image.asset(
                        'assets/icons/Profile.png',
                        fit: BoxFit.contain,
                        color: currentIndex == 3
                            ? primaryColor
                            : secondaryTextColor,
                      ),
                    ),
                  ),
                  label: '')
            ],
          ),
        ),
      ),
      body: pages(),
    );
  }
}
