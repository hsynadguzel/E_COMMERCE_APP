import 'package:e_commerce/data/dbHelper.dart';
import 'package:e_commerce/model/shopping_cart_model.dart';
import 'package:e_commerce/screens/categories/categories_screen.dart';
import 'package:e_commerce/screens/shopping_cart/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoriDetail extends StatefulWidget {
  final String? title;
  final String? discount;
  final String? photoUrl;
  final String? productName;
  final double? price;
  final String? featuresTitle;
  final String? features;
  const CategoriDetail(
      {Key? key,
      this.title,
      this.discount,
      this.photoUrl,
      this.productName,
      this.price,
      this.featuresTitle,
      this.features})
      : super(key: key);

  @override
  State<CategoriDetail> createState() => _CategoriDetailState();
}

class _CategoriDetailState extends State<CategoriDetail> {
  var dbHelper = DbHelper();
  bool _isfavorite = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isfavorite) {
        _favoriteCount -= 1;
        _isfavorite = false;
      } else {
        _favoriteCount += 1;
        _isfavorite = true;
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 29.0),
                  //geri_button
                  returnButton(context),
                  const SizedBox(height: 24.0),
                  // product name and favorite icon
                  buildBanner(),
                  const SizedBox(height: 16.0),
                  //içerik
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildDiscount(),
                            const SizedBox(height: 25.0),
                            buildProductPhoto(),
                            const SizedBox(height: 30.0),
                            buildFeaturesTitle(),
                            const SizedBox(height: 10.0),
                            buildFeatures(),
                            const SizedBox(height: 20.0),
                            buyingButton(),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildBanner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff0a1034),
          ),
        ),
        IconButton(
          onPressed: () {
            if (_isfavorite == false) {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text(
                    'INFORMATION',
                  ),
                  content: const Text(
                    'Do you want to like this product?',
                  ),
                  actions: [
                    CupertinoDialogAction(
                        onPressed: _toggleFavorite,
                        child: const Text(
                          'Yes',
                        )),
                    CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No')),
                  ],
                ),
              );
            } else {
              _toggleFavorite();
            }
          },
          icon: (_isfavorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                )),
        ),
      ],
    );
  }

  GestureDetector returnButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff0a1034),
        size: 27,
      ),
    );
  }

  Container buildDiscount() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: const Color(0xffe0ecf8)),
      child: Text(
        widget.discount!,
        style: const TextStyle(
            color: Color(0xff1f53e4),
            fontSize: 13.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Center buildProductPhoto() => Center(child: Image.asset(widget.photoUrl!));

  Text buildFeaturesTitle() {
    return Text(
      widget.featuresTitle!,
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: Color(0xff0a1034)),
      textAlign: TextAlign.justify,
    );
  }

  Text buildFeatures() {
    return Text(
      widget.features!,
      style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 17.0,
          color: Color(0xff0a1034),
          fontFamily: 'Comic-Sans'),
      textAlign: TextAlign.justify,
    );
  }

  GestureDetector buyingButton() {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: const Text('Summary'),
            message: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name: ${widget.productName}',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Product Features: ${widget.featuresTitle}',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Product Price: ${widget.price} \$',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  await launch(
                      "https://wa.me/905512367980?text=Product Name: ${widget.productName},\nProduct Features: ${widget.featuresTitle},\nProduct Price: ${widget.price}\nI want to buy from the product.");
                },
                child: const Text(
                    'Switch To Payment Screen'), // ödeme ekranına geç
              ),
              CupertinoActionSheetAction(
                onPressed: () => launch("tel://+905555555555"),
                child: const Text(
                    'Get Information By Calling'), // Arayarak Bilgi Alın
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  addCart();
                },
                child: const Text('Add To Basket'), // sepete ekle
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: Navigator.of(context).pop,
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: const Color(0xff1f53e4),
        ),
        child: Text(
          ("BUY ${widget.price} \$"),
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  void addCart() async {
    var result = await dbHelper.insert(
      Cart(
        name: widget.productName,
        description: widget.featuresTitle,
        photo: widget.photoUrl,
        unitPrice: double.tryParse(widget.price.toString()),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'INFORMATION',
        ),
        content: const Text(
          'This product has been added to the cart! \n Would you like to go to cart ?',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartPage(),
                ),
              );
            },
            child: const Text(
              'Yes',
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriPage(),
              ),
            ),
            child: const Text(
              'No',
            ),
          ),
        ],
      ),
    );
  }
}
