import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constant/bottom_nav_bar.dart';
import 'package:e_commerce/model/user_firestore_model.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/user_operations/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  int currentIndex = 3;
  User? user = FirebaseAuth.instance.currentUser;
  UserFirestore userInfo = UserFirestore();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('Person')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        userInfo = UserFirestore.fromMap(value.data());
      });
      log(userInfo.toString());
    });
    super.initState();
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
                  buildPageTitle('Person'),
                  const SizedBox(height: 18.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            iconNameSurnameWidget(),
                            const SizedBox(height: 35.0),
                            mailPasswordContainerWidget(context),
                            const SizedBox(height: 30.0),
                            logoutButtonWidget(context),
                            const Icon(Icons.logout),
                          ],
                        ),
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

  TextButton logoutButtonWidget(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
      child: const Text(
        'LOGOUT',
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 5, 76, 135)),
      ),
    );
  }

  Container mailPasswordContainerWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 198, 26, 26),
            Color.fromARGB(255, 3, 116, 208),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25.0),
            const Text(
              'YOUR MAIL',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Center(
                child: Text(
                  userInfo.email.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'YOUR PASSWORD',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Center(
                child: Text(
                  userInfo.password.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Row iconNameSurnameWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.person_pin,
              size: 100.0,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo.name.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  userInfo.surname.toString(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        QrImage(
          data:
              '${userInfo.email.toString()}\n${userInfo.name.toString()}\n${userInfo.surname.toString()}',
          size: 80.0,
          padding: const EdgeInsets.all(20.0),
        ),
      ],
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
