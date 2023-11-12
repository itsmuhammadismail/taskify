import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

  String password;

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
    required this.password,
  });

  // Add a converter to from JSON
  static UserInterface fromJSON(Map<String, dynamic> jsonData) {
    return UserInterface(
        id: jsonData["id"],
        first_name: jsonData["first_name"],
        last_name: jsonData["last_name"],
        email: jsonData["email"],
        country: jsonData["country"],
        dob: jsonData["dob"],
        gender: jsonData["gender"],
        mobile: jsonData["mobile"],
        university: jsonData["university"],
        password: jsonData["password"] ?? '');
  }

  // Add a converter to from an encoded JSON string
  static UserInterface fromJSONString(String jsonDataString) {
    Map<String, dynamic> jsonData = json.decode(jsonDataString);
    return UserInterface.fromJSON(jsonData);
  }

  // Add a converter to JSON
  dynamic toJSON() {
    return {
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "country": country,
      "dob": dob,
      "gender": gender,
      "mobile": mobile,
      "university": university,
      "password": password,
    };
  }

  // Add a converter to JSON string
  String toJSONString() {
    return json.encode(toJSON());
  }
}

class UserProvider with ChangeNotifier {
  late UserInterface _user = UserInterface(
      id: '',
      first_name: '',
      last_name: '',
      email: '',
      dob: '',
      gender: '',
      university: '',
      mobile: '',
      country: '',
      password: '');

  UserProvider() {
    // Read the data on the creation of a state
    readData();
  }

  void readData() async {
    // Load the data from the shared preferences
    final prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    userString ??= "";

    // Load the data into the state
    _user = UserInterface.fromJSONString(userString);

    // Notify the listeners
    notifyListeners();
  }

  void setData() async {
    // Load the shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Load the data into the shared preferences
    String datasetString = _user.toJSONString();

    await prefs.setString("user", datasetString);
  }

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
    setData();
    notifyListeners();
  }

  clearUser() {
    _user.id = '';
    _user.first_name = '';
    _user.last_name = '';
    _user.email = '';
    _user.dob = '';
    _user.gender = '';
    _user.university = '';
    _user.mobile = '';
    _user.country = '';
    setData();
  }
}
