import 'package:e_commerce/screens/categories/categories_screen.dart';
import 'package:e_commerce/screens/currency_calculator/currency_calculator.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/user_operations/person_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Padding bottomNavBar(BuildContext context, currentindex) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: GNav(
      padding: const EdgeInsets.all(8.0),
      activeColor: Colors.white,
      tabBackgroundColor: Colors.grey.shade600,
      haptic: true,
      gap: 8.0,
      selectedIndex: currentindex,
      /*onTabChange: (value) {
          setState(() {
            currentIndex = value;
          });
        },*/
      tabs: [
        GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const HomePage()),
                ),
              );
            }),
        GButton(
            icon: Icons.menu,
            text: 'Products',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const CategoriPage()),
                ),
              );
            }),
        GButton(
            icon: Icons.bar_chart,
            text: 'Currency',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const CurrencyCalculatorPage()),
                ),
              );
            }),
        GButton(
          icon: Icons.person,
          text: 'Person',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const PersonPage()),
              ),
            );
          },
        ),
      ],
    ),
  );
}
