import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskify/app.dart';
import 'package:taskify/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taskify/notification_service.dart';

extension StringExtension on String {
  String capitalize() {
    if (length > 0) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
    return this;
  }
}

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); 

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
