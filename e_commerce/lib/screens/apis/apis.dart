import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List apiList = [];
  // api request
  Future<dynamic> _getApi() async {
    http.Response response = await http.get(
      Uri.parse('http://hasanadiguzel.com.tr/api/bilgiamackur'),
    );
    print("Response status: ${response.statusCode}");
    var jsonResponse = utf8.decode(response.body.runes.toList());
    var jsonRespone2 = Map<String, dynamic>.from(jsonDecode(jsonResponse));

    List uList = [];
    if (response.statusCode == 200) {
      for (var jsondata in jsonRespone2["TCMB_BilgiAmacliKurlar"]) {
        apiList.add(jsonRespone2["TCMB_BilgiAmacliKurlar"]);
      }
    }
    setState(() {
      apiList;
    });
    log(apiList.toString());
  }

  @override
  void initState() {
    _getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 29.0),
              // geri_button
              returnButton(context),
              const SizedBox(height: 24.0),
              // sayfa basligi
              buildPageTitle('API\'s of TCMB CURRECY RATES'),
              const SizedBox(height: 16.0),
              apiList.isEmpty ? loadingListWidget() : listWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // liste yükleniyor iconu
  Center loadingListWidget() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200.0),
          LoadingAnimationWidget.discreteCircle(
            color: Colors.blue,
            size: 50.0,
          ),
          const SizedBox(height: 20.0),
          const Text('LOADING LIST'),
        ],
      ),
    );
  }

  // ekrana yansıtılan liste
  Expanded listWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: apiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'UNIT', 'Unit'),
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'NAME', 'Isim'),
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'CURRENCY NAME', 'CurrencyName'),
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'EXCHANGE RATE', 'ExchangeRate'),
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'CODE', 'Kod'),
                    const SizedBox(height: 4.0),
                    listTextWidget(index, 'CURRENCY CODE', 'CurrencyCode'),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // listenin içindeki yazılar
  Row listTextWidget(int index, String title, String item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(apiList[0][index][item].toString()),
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
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff0a1034),
        size: 27,
      ),
    );
  }
}
