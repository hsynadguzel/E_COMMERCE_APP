import 'package:flutter/material.dart';

class UserFirestore {
  String? name;
  String? surname;
  String? email;
  String? password;

  UserFirestore({
    @required this.name,
    @required this.surname,
    @required this.email,
    @required this.password,
  });

  factory UserFirestore.fromMap(map) {
    return UserFirestore(
      name: map['userName'],
      surname: map['userSurname'],
      email: map['userMail'],
      password: map['userPassword'],
    );
  }
}
