import 'package:flutter/material.dart';
import 'package:ichwan_shoe_market/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int countChat = 1;

  @override
  Widget build(BuildContext context) {
    // * NO CHAT RECENT
    Widget emptyChat() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/HeadsetIcon.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Opss no message yet?',
                style: textStyle.copyWith(
                    fontSize: 16, color: primaryTextColor, fontWeight: medium)),
            const SizedBox(
              height: 12,
            ),
            Text('You have never done a transaction',
                style: textStyle.copyWith(
                    fontSize: 14,
                    color: placeholderTextColor,
                    fontWeight: medium)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/main-page', (route) => false,
                  arguments: 0),
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text(
                  'Explore Store',
                  style: textStyle.copyWith(
                      color: primaryTextColor,
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      );
    }

    // * CHAT RECENT
    Widget chatRecent() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/profileichwan.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ichwan Store',
                          style: textStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                              color: primaryTextColor)),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: textStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                            color: placeholderTextColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(87),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor1,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: SafeArea(
              child: Center(
            child: Text(
              'Message Support',
              style: textStyle.copyWith(
                  color: primaryTextColor, fontSize: 20, fontWeight: semiBold),
            ),
          )),
        ),
      ),
      body: countChat > 0 ? chatRecent() : emptyChat(),
    );
  }
}
