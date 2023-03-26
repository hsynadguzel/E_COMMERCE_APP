import 'package:e_commerce/constant/bottom_nav_bar.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCalculatorPage extends StatefulWidget {
  const CurrencyCalculatorPage({Key? key}) : super(key: key);

  @override
  State<CurrencyCalculatorPage> createState() => _CurrencyCalculatorPageState();
}

class _CurrencyCalculatorPageState extends State<CurrencyCalculatorPage> {
  PageController controller = PageController();
  TextEditingController adetController = TextEditingController();
  TextEditingController firstBirimController = TextEditingController();
  TextEditingController secondBirimController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int currentIndex = 2;

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
                  buildPageTitle('Currency Calculator'),
                  const SizedBox(height: 16.0),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: ListView(
                        children: [
                          // miktarı girin - adet text
                          textfieldTitle('Enter Amount:'),
                          const SizedBox(height: 5.0),
                          // adet textfield
                          buildAdetTextfield('Adet', TextInputAction.next),
                          const SizedBox(height: 10.0),
                          // şu an ki para birimi text
                          textfieldTitle('Valid Currency:'),
                          const SizedBox(height: 5.0),
                          // birim textfield
                          buildBirimTextfield(
                              TextInputAction.next, firstBirimController),
                          const SizedBox(height: 10.0),
                          // dönüştürülecek para birimi text
                          textfieldTitle('The Unit You Want to Convert:'),
                          const SizedBox(height: 5.0),
                          // birim textfield
                          buildBirimTextfield(
                              TextInputAction.done, secondBirimController),
                          const SizedBox(height: 20.0),
                          // hesapla button
                          buildHesaplaButton(),
                          const SizedBox(height: 20.0),
                          // aydınlatma metni texti
                          buildLightingText(),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, currentIndex),
    );
  }

  // aydınlatma metni
  RichText buildLightingText() {
    return RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 16.0),
        children: [
          TextSpan(
            text: 'Aydınlatma Metni:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                ' Lorem Impus dolor sit amet, consectetur adipiscing elit. Maecenas varius ac arcu ac finibus. Aenean aliquet vehicula mi eu ultricies. Nunc vitae neque quis justo auctor mollis nec sit amet erat. Morbi fermentum lectus sed massa mollis, pretium vulputate dolor porta. Vestibulum a sapien vel ante dapibus ornare. Sed sit amet fermentum lacus. Ut eget imperdiet libero. Phasellus dapibus urna luctus tellus ornare consectetur. Morbi auctor arcu quis quam facilisis, quis viverra nibh sagittis. Aliquam egestas, eros quis feugiat finibus, est lectus tincidunt sapien, ut pulvinar turpis nisl ut ex. Duis vel malesuada tellus. Ut dignissim justo non semper imperdiet. In interdum velit sed neque interdum suscipit.',
          ),
        ],
      ),
    );
  }

  // hesapla fonksiyonu
  String calculateFunction() {
    int adet = int.parse(adetController.text);
    double firstBirim = double.parse(firstBirimController.text);
    double secondBirim = double.parse(secondBirimController.text);
    double finalResult = ((adet * firstBirim) * secondBirim);
    String sonuc = finalResult.toStringAsFixed(3);
    return sonuc;
  }

  // hesapla buttonu
  Center buildHesaplaButton() {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text('Results'), // sonuçlar
                message: Column(
                  children: [
                    Text('Piece: ${adetController.text}'), // adet
                    Text(
                        'Main Unit: ${firstBirimController.text}'), // ana birim
                    Text(
                        'Target Unit: ${secondBirimController.text}'), // hedef birim
                    Text(
                      'Result: ${calculateFunction().toString()}', // sonuç
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Okey',
                    ),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isDefaultAction: true,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            );
          }
        },
        child: const Text('Calculate'),
      ),
    );
  }

  // birimlerin textfieldı
  TextFormField buildBirimTextfield(
      TextInputAction? textinputaction, TextEditingController? controller) {
    return TextFormField(
      controller: controller!,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      textInputAction: textinputaction!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan boş geçilemez!';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Birim Fiyatı',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Adet textfieldı
  TextFormField buildAdetTextfield(
      String? hinttext, TextInputAction? textinputaction) {
    return TextFormField(
      controller: adetController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      textInputAction: textinputaction!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan boş geçilemez!';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hinttext!,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // textfield başlıkları
  Text textfieldTitle(String? title) => Text(
        title!,
        style: const TextStyle(fontSize: 16.0),
      );

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
