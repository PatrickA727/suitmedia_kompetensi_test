import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String uname = '';

  String get username => uname;

  void setUsername(String username) {
    uname = username;
    notifyListeners();
  }
}