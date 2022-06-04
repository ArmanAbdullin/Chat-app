import 'package:chat_app/pages/calls_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/messages_page.dart';
import 'package:chat_app/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    CallPage(),
    NotificationsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: _BottomNagigationBar(
        onitemSelected: (index) {
          print(index);
        },
      ),
    );
  }
}

class _BottomNagigationBar extends StatelessWidget {
  const _BottomNagigationBar({
    Key? key,
    required this.onitemSelected,
  }) : super(key: key);

  final ValueChanged<int> onitemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavigationBarItem(
              index: 0,
              lable: 'Messages',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              onTap: onitemSelected,
            ),
            _NavigationBarItem(
              index: 1,
              lable: 'Notifications',
              icon: CupertinoIcons.bell_solid,
              onTap: onitemSelected,
            ),
            _NavigationBarItem(
              index: 2,
              lable: 'Calls',
              icon: CupertinoIcons.phone_fill,
              onTap: onitemSelected,
            ),
            _NavigationBarItem(
              index: 3,
              lable: 'Contacts',
              icon: CupertinoIcons.person_2_fill,
              onTap: onitemSelected,
            ),
          ],
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.index,
      required this.lable,
      required this.icon,
      required this.onTap})
      : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(
              lable,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
