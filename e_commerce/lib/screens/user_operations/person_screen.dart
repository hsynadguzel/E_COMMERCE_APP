import 'package:e_commerce/constant/bottom_nav_bar.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/user_operations/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  int currentIndex = 3;

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
                  buildPageTitle('Person'),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_pin,
                            size: 100.0,
                          ),
                          const SizedBox(height: 8.0),
                          const Text('The under construction.'),
                          const SizedBox(height: 16.0),
                          // button
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                            child: const Text('LOGIN PAGE'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, currentIndex),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage()),
          ),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff0a1034),
        size: 27,
      ),
    );
  }
}
