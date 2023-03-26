import 'package:e_commerce/screens/user_operations/login_screen.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AuthService _authService = AuthService();

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
                    registerPageIcon(),
                    const SizedBox(height: 28.0),
                    firstNameField(),
                    const SizedBox(height: 12.0),
                    lastNameField(),
                    const SizedBox(height: 12.0),
                    emailField(),
                    const SizedBox(height: 12.0),
                    passwordField(),
                    const SizedBox(height: 12.0),
                    confirmPasswordField(),
                    const SizedBox(height: 18.0),
                    registerButton(),
                    const SizedBox(height: 18.0),
                    noteText()
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Icon registerPageIcon() {
    return const Icon(
      Icons.app_registration_rounded,
      size: 100.0,
    );
  }

  firstNameField() {
    return TextFormField(
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) return ("First Name cannot be Empty");
        if (value.length < 3) return ("Enter Valid name(Min. 3 Character)");
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  lastNameField() {
    return TextFormField(
      controller: lastNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) return ("Second Name cannot be Empty");
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Last Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) return ("Please Enter Your Email");
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
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
      obscureText: true,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) return ("Password is required for login");
        if (value.length < 6) return ("Enter Valid Password(Min. 6 Character)");
        return null;
      },
      textInputAction: TextInputAction.next,
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

  confirmPasswordField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Password don't match !";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  registerButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8.0), // 30.0
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _authService
                .createPerson(firstNameController.text, lastNameController.text,
                    emailController.text, passwordController.text)
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Kayıt Başarılı Giriş Sayfasına Yönlendiriliyorsunuz.'),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            });
          }
        },
        child: const Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  noteText() {
    return RichText(
      text: const TextSpan(
        text: 'Note:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Fill in the fields completely!',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
