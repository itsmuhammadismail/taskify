import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    void _navigateToNextScreen() async {
      await Future.delayed(const Duration(seconds: 2));
      Navigate.next(context, LoginScreen.id);
    }

    useEffect(() {
      _navigateToNextScreen();
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logos/taskify.png'),
      ),
    );
  }
}
