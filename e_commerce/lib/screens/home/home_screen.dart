import 'package:e_commerce/constant/bottom_nav_bar.dart';
import 'package:e_commerce/screens/apis/apis.dart';
import 'package:e_commerce/screens/currency_calculator/currency_calculator.dart';
import 'package:e_commerce/screens/home/components/home_constant.dart';
import 'package:e_commerce/constant/showcase_item_card.dart';
import 'package:e_commerce/screens/categories/categories_screen.dart';
import 'package:e_commerce/model/showcase_product_model.dart';
import 'package:e_commerce/screens/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xfffdfeff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Baslik
              buildBaslik('Home'),
              // Banner
              buildBanner(),
              // Buttonlar
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // 48.0
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildNavigation(
                      icon: Icons.menu,
                      context: context,
                      text: 'Products',
                      widget: const CategoriPage(),
                    ),
                    BuildNavigation(
                      icon: Icons.shopping_cart,
                      context: context,
                      text: 'Cart',
                      widget: const ShoppingCartPage(),
                    ),
                    BuildNavigation(
                      icon: Icons.api,
                      context: context,
                      text: 'API\'s',
                      widget: const ApiPage(),
                    ),
                    BuildNavigation(
                      icon: Icons.bar_chart,
                      context: context,
                      text: 'Currency',
                      widget: const CurrencyCalculatorPage(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0, // 40.0
              ),
              // ShowCase text
              showCaseText(),
              const SizedBox(
                height: 10.0, // 16.0
              ),
              // ShowCase item
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GridView.builder(
                    itemCount: showCaseProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.64,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      showCaseProduct: showCaseProducts[index],
                    ),
                  ),
                ),
              ),
              //const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, currentIndex),
    );
  }
}
