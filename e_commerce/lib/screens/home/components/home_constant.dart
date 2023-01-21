import 'package:flutter/material.dart';

// baslik
Widget buildBaslik(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 32, color: Color(0xff0a1034), fontWeight: FontWeight.bold),
    ),
  );
}

// banner
Widget buildBanner() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0), // 24.0
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          left: 24.0, right: 36.0, top: 14.0, bottom: 18.0),
      decoration: BoxDecoration(
        color: const Color(0xff0001fc),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome to the App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Slogan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset(
            'assets/images/apps.png',
            width: 75,
            height: 85,
            color: Colors.white70,
          ),
        ],
      ),
    ),
  );
}

// buttonlar
Widget BuildNavigation(
    {@required String? text,
    @required IconData? icon,
    @required Widget? widget,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return widget!;
          },
        ),
      );
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 22.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffe0ecf8),
          ),
          child: Icon(
            icon,
            color: const Color(0xff0001fc),
            size: 18.0,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          text!,
          style: const TextStyle(
              color: Color(0xff1f53e4),
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

// ShowCase Text
Center showCaseText() {
  return const Center(
    child: Text(
      'ShowCase',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff0a1034),
      ),
    ),
  );
}

// ShowCase ürün
Widget BuildSale(
    {@required String? text,
    @required String? photoUrl,
    @required String? discount,
    BuildContext? context,
    Widget? widget,
    @required double? screenwidth}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return widget!;
          },
        ),
      );
    },
    child: Container(
      color: Colors.white,
      width: (screenwidth! - 40) * 0.5,
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
              discount!,
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
              photoUrl!,
              width: 150.0,
              height: 150.0,
            ),
          ),
          const SizedBox(
            height: 22.0,
          ),
          Center(
            child: Text(
              text!,
              style: const TextStyle(fontSize: 18.0, color: Color(0xff0a1034)),
            ),
          ),
        ],
      ),
    ),
  );
}
