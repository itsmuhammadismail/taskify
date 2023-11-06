import 'package:flutter/material.dart';

class UserInterface {
  String id,
      first_name,
      last_name,
      email,
      dob,
      gender,
      university,
      mobile,
      country;

  UserInterface({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.dob,
    required this.gender,
    required this.university,
    required this.mobile,
    required this.country,
  });
}

class UserProvider with ChangeNotifier {
  UserInterface _user = UserInterface(
      id: '',
      first_name: '',
      last_name: '',
      email: '',
      dob: '',
      gender: '',
      university: '',
      mobile: '',
      country: '');

  UserInterface get user => _user;

  set user(UserInterface newUser) {
    _user.id = newUser.id;
    _user.first_name = newUser.first_name;
    _user.last_name = newUser.last_name;
    _user.email = newUser.email;
    _user.dob = newUser.dob;
    _user.gender = newUser.gender;
    _user.university = newUser.university;
    _user.mobile = newUser.mobile;
    _user.country = newUser.country;
    print(_user);
    notifyListeners();
  }
}
