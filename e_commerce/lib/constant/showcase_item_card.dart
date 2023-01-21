import 'package:e_commerce/model/showcase_product_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final ShowCaseProduct? showCaseProduct;
  final Function? press;
  const ItemCard({Key? key, this.showCaseProduct, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        //width: (screenwidth! - 40) * 0.5,
        padding: const EdgeInsets.only(
            left: 12.0, top: 12.0, bottom: 21.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: const Color(0xffe0ecf8)),
              child: Text(
                showCaseProduct!.discount.toString(),
                style: const TextStyle(
                  color: Color(0xff1f53e4),
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Center(
              child: Image.asset(
                showCaseProduct!.photoUrl.toString(),
                width: 150.0,
                height: 150.0,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Center(
              child: Text(
                showCaseProduct!.productName.toString(),
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff0a1034)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
