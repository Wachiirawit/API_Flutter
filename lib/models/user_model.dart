// import 'dart:convert';

// import 'package:flutter/foundation.dart';

class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

//เขียน รับ required แบบสั้น
  // UserModel(this.id, this.email, this.firstname, this.lastname, this.avatar);

  UserModel(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'] ?? 'First name',
        lastname: json['last_name'] ?? 'last name',
        avatar: json['avatar'] ??
            'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740');
  }
}
