import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // giriş yap fonksiyonu
  Future<User?> singIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  // çıkış yap fonksiyonu
  singOut() async {
    return await _auth.signOut();
  }

  // kayıt ol fonksiyonu
  Future<User?> createPerson(
      String name, String surname, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection('Person').doc(user.user!.uid.toString()).set({
      'userName': name,
      'userSurname': surname,
      'userMail': email,
      'userPassword': password,
    });

    return user.user;
  }
}
