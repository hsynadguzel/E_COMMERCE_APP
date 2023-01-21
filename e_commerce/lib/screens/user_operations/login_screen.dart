import 'package:e_commerce/screens/user_operations/register_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 198, 26, 26),
            Color.fromARGB(255, 3, 116, 208)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      loginPageIcon(),
                      const SizedBox(height: 50.0),
                      helloAgainText(),
                      const SizedBox(height: 50.0),
                      emailField(),
                      const SizedBox(height: 10.0),
                      passwordField(),
                      const SizedBox(height: 20.0),
                      loginButton(),
                      const SizedBox(height: 30.0),
                      registerNowText(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginPageIcon() {
    return Image.asset(
      'assets/images/apps.png',
      width: 75.0,
      color: Colors.black,
    );
  }

  Text helloAgainText() {
    return const Text(
      'HELLO AGAIN!',
      style: TextStyle(
          fontSize: 45, fontWeight: FontWeight.w600, fontFamily: 'Comic Sans'),
    );
  }

  emailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) return ('Please Enter Your Email');
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: false,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.isEmpty) return ('Please Enter Your Password');
        if (value.length < 6) return ('Enter Valid Password(Min. 6 Character)');
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  loginButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8.0), // 30.0
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            /*signIn(emailController.text, passwordController.text);*/
          }
        },
        child: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  registerNowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Not a member? ',
          style: TextStyle(fontSize: 15, fontFamily: 'comic-sans'),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'comic-sans',
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
