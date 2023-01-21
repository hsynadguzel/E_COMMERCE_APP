import 'dart:developer';
import 'package:e_commerce/data/dbHelper.dart';
import 'package:e_commerce/model/shopping_cart_model.dart';
import 'package:e_commerce/screens/categories/categories_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  var dbHelper = DbHelper();
  List<Cart>? carts;
  int productCount = 0;
  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        carts = data;
        productCount = data.length;
      });
    });
  }

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
                  buildPageTitle('Cart'),
                  const SizedBox(height: 16.0),
                  // cart veritabanındaki ürünler
                  productCount == 0
                      ? buildBodyNull(context) // listede ürün yoksa
                      : Expanded(
                          child: ListView.builder(
                            itemCount: productCount,
                            itemBuilder: (BuildContext context, int position) {
                              return Card(
                                color: Colors.white,
                                elevation: 2.0,
                                child: ListTile(
                                  leading: Image.asset(
                                      carts![position].photo.toString()),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () {
                                      showDialogDelete(context, position);
                                    },
                                  ),
                                  title: Text(carts![position].name.toString()),
                                  subtitle: Text(
                                      "${carts![position].description}, \n${carts![position].unitPrice}\$"),
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 10.0),
                  // satın alma buttonu
                  buyingButton(context),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // listede ürün yoksa çalşacak gövde
  Expanded buildBodyNull(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriPage(),
                ),
              ),
              child: Image.asset(
                'assets/images/shopping-cart.png',
                width: 90.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('Start Shopping'),
          ],
        ),
      ),
    );
  }

  // satın alma buttonu - buying button
  GestureDetector buyingButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  await launch(
                      "https://wa.me/905512367980?text=Product Name: Application User ID,\n I want to buy the products in my cart.");
                },
                child: const Text(
                    'Switch To Payment Screen'), // ödeme ekranına geç
              ),
              CupertinoActionSheetAction(
                onPressed: () => launch("tel://+905555555555"),
                child: const Text(
                    'Get Information By Calling'), // Arayarak Bilgi Alın
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
        child: const Text(
          "Buy Product(s)",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  // show dialog silme ekranı
  Future<dynamic> showDialogDelete(BuildContext context, int position) {
    return showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'UYARI',
        ),
        content: const Text(
          'Bu ürün sepetten çıkartmak mı istiyorsunuz?',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              deleteCart(position);
              var productsFuture = dbHelper.getProducts();
              productsFuture.then((data) {
                setState(() {
                  carts = data;
                  productCount = data.length;
                });
              });
              Navigator.of(context).pop(true);
            },
            child: const Text(
              'Evet',
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Hayır',
            ),
          ),
        ],
      ),
    );
  }

  // sayfa basligi
  Text buildPageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xff0a1034),
      ),
    );
  }

  // geri buttonu
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

  // veritabanından ürün silme komutu
  void deleteCart(int position) async {
    await dbHelper.delete(carts![position].id!.toInt());
  }
}
