import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/providers/credentials_provider.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'widgets/body.dart';

class SaveInfoScreen extends StatelessWidget {
  const SaveInfoScreen({super.key});

  static String id = "save_info_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
