import 'package:flutter/rendering.dart';

class Login {
  String accessToken;
  String userId;
  String username;
  String password;
  String phoneNumber;
  String role;
  Login(
      {required this.userId,
      required this.password,
      required this.phoneNumber,
      required this.accessToken,
      required this.role,
      required this.username});
  factory Login.fromMap(loginData) {
    return Login(
        userId: loginData['userId'],
        accessToken: loginData['accessToken'],
        username: loginData['username'],
        role: loginData['role'],
        password: loginData['password'],
        phoneNumber: loginData['phoneNumber']);
  }
}
