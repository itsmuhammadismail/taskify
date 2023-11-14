import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CredentialsInterface {
  String email, password;
  bool save;

  CredentialsInterface({
    required this.email,
    required this.password,
    this.save = false,
  });

  // Add a converter to from JSON
  static CredentialsInterface fromJSON(Map<String, dynamic> jsonData) {
    return CredentialsInterface(
      email: jsonData["email"],
      password: jsonData["password"],
      save: jsonData["save"] as bool,
    );
  }

  // Add a converter to from an encoded JSON string
  static CredentialsInterface fromJSONString(String jsonDataString) {
    Map<String, dynamic> jsonData = json.decode(jsonDataString);
    return CredentialsInterface.fromJSON(jsonData);
  }

  // Add a converter to JSON
  dynamic toJSON() {
    return {"email": email, "password": password, "save": save};
  }

  // Add a converter to JSON string
  String toJSONString() {
    return json.encode(toJSON());
  }
}

class CredentialsProvider with ChangeNotifier {
  late CredentialsInterface _credentials = CredentialsInterface(
    email: '',
    password: '',
  );

  CredentialsProvider() {
    // Read the data on the creation of a state
    readData();
  }

  void readData() async {
    // Load the data from the shared preferences
    final prefs = await SharedPreferences.getInstance();
    String? credentialsString = prefs.getString("credentials");
    credentialsString ??= "";

    // Load the data into the state
    _credentials = CredentialsInterface.fromJSONString(credentialsString);

    // Notify the listeners
    notifyListeners();
  }

  void setData() async {
    // Load the shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Load the data into the shared preferences
    String datasetString = _credentials.toJSONString();

    await prefs.setString("credentials", datasetString);
  }

  CredentialsInterface get credentials => _credentials;

  set credentials(CredentialsInterface newCredentials) {
    _credentials.email = newCredentials.email;
    _credentials.password = newCredentials.password;
    setData();
    notifyListeners();
  }

  isSave(bool item) {
    _credentials.save = item;
    setData();
    notifyListeners();
  }

  clearCredentials() {
    _credentials.email = '';
    _credentials.password = '';
    setData();
  }
}
