import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.07;

    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: iconSize),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard, size: iconSize),
          label: 'Gifts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount, size: iconSize),
          label: 'Discounts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: iconSize),
          label: 'Profile',
        ),
      ],
    );
  }
}
