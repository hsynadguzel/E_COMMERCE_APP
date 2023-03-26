import 'package:e_commerce/constant/bottom_nav_bar.dart';
import 'package:e_commerce/constant/categori_item_card.dart';
import 'package:e_commerce/model/products_model.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CategoriPage extends StatefulWidget {
  const CategoriPage({Key? key}) : super(key: key);

  @override
  State<CategoriPage> createState() => _CategoriPageState();
}

class _CategoriPageState extends State<CategoriPage> {
  PageController controller = PageController();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 29.0),
                  // geri_button
                  returnButton(context),
                  const SizedBox(height: 24.0),
                  // sayfa basligi
                  buildPageTitle('Products'),
                  const SizedBox(height: 16.0),
                  //categories
                  categoriListWidget(),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, currentIndex),
    );
  }

  // liste içeriği
  Expanded categoriListWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GridView.builder(
          itemCount: productssDetail.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) => CategoriItemCard(
            discount: productssDetail[index].discount.toString(),
            photoUrl: productssDetail[index].photoUrl.toString(),
            productName: productssDetail[index].productName.toString(),
            price: productssDetail[index].price,
            featuresTitle: productssDetail[index].featuresTitle.toString(),
            features: productssDetail[index].features.toString(),
          ),
        ),
      ),
    );
  }

  // sayfa basligi
  Text buildPageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff0a1034),
      ),
    );
  }

  // geri buttonu
  GestureDetector returnButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff0a1034),
        size: 27.0,
      ),
    );
  }
}
