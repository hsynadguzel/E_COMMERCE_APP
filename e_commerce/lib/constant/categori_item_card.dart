import 'package:e_commerce/screens/categories/categorie_detail_screen.dart';
import 'package:flutter/material.dart';

class CategoriItemCard extends StatelessWidget {
  final Function? press;
  final String? discount;
  final String? photoUrl;
  final String? productName;
  final double? price;
  final String? featuresTitle;
  final String? features;
  const CategoriItemCard({
    Key? key,
    this.press,
    required this.discount,
    required this.photoUrl,
    required this.productName,
    required this.price,
    this.featuresTitle,
    this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CategoriDetail(
                  title: this.productName.toString(),
                  discount: this.discount.toString(),
                  photoUrl: this.photoUrl.toString(),
                  productName: this.productName.toString(),
                  price: this.price,
                  featuresTitle: this.featuresTitle,
                  features: this.features,
                  //  featuresTitle: ,
                )),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        padding: const EdgeInsets.only(
            left: 12.0, top: 12.0, bottom: 10.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 4.0, right: 4.0, left: 4.0, bottom: 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: const Color(0xffe0ecf8)),
              child: Text(
                discount!,
                style: const TextStyle(
                  color: Color(0xff1f53e4),
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 22.0),
            Center(
              child: Image.asset(
                photoUrl!,
                width: 150.0,
                height: 150.0,
              ),
            ),
            const SizedBox(height: 22.0),
            Center(
              child: Text(
                productName!,
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff0a1034)),
              ),
            ),
            const SizedBox(height: 7.0),
            Center(
              child: Text(
                '$price \$',
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff0001fc),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
