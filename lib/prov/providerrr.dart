import 'package:flutter/material.dart';

class UserProviderr with ChangeNotifier {
  String namee = '';

  String get usernamee => namee;

  void setName(String usernamee) {
    namee = usernamee;
    notifyListeners();
  }
}