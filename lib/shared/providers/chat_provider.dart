import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:taskify/modules/chatgpt/screens/chat/models/messageModel.dart';
import 'package:uuid/uuid.dart';

class ChatInterface {
  final MessageModel message;

  ChatInterface({
    required this.message,
  });

  // Add a converter to from JSON
  static ChatInterface fromJSON(Map<String, dynamic> jsonData) {
    return ChatInterface(
      message: MessageModel(
        text: jsonData['text'],
        messageid: jsonData['messageid'],
        sender: jsonData['sender'],
        createdon: DateTime.parse(jsonData['createdon']),
      ),
    );
  }

  // Add a converter to from an encoded JSON string
  static ChatInterface fromJSONString(String jsonDataString) {
    Map<String, dynamic> jsonData = json.decode(jsonDataString);
    return ChatInterface.fromJSON(jsonData);
  }

  // Add a converter to JSON
  dynamic toJSON() {
    return {
      "text": message.text,
      "messageid": message.messageid,
      "sender": message.sender,
      "createdon": message.createdon?.toIso8601String(),
    };
  }

  // Add a converter to JSON string
  String toJSONString() {
    return json.encode(toJSON());
  }
}

class ChatProvider with ChangeNotifier {
  late List<ChatInterface> _chat = [];
  List<ChatInterface> get chat => _chat;

  ChatProvider() {
    // Read the data on the creation of a state
    readData();
  }

  void readData() async {
    // Load the data from the shared preferences
    final prefs = await SharedPreferences.getInstance();
    List<String>? chatStrings = prefs.getStringList("chat");
    chatStrings ??= [];

    // Load the data into the state
    _chat = chatStrings
        .map((jsonData) => ChatInterface.fromJSONString(jsonData))
        .toList();

    // Notify the listeners
    notifyListeners();
  }

  void setData() async {
    // Load the shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Load the data into the shared preferences
    List<String> datasetStrings =
        _chat.map((dataPoint) => dataPoint.toJSONString()).toList();

    await prefs.setStringList("chat", datasetStrings);
  }

  addChat(MessageModel message) {
    _chat.insert(0, ChatInterface(message: message));
  }

  updateFirst(MessageModel message) {
    _chat[0] = ChatInterface(message: message);
  }

  clearChat() {
    _chat = [];
    setData();
  }
}
