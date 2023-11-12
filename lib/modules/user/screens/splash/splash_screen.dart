import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/routes/navigate.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    var user = Auth().currentUser;

    void _navigateToNextScreen() async {
      // await Future.delayed(const Duration(seconds: 2));

      // if (id == '') {
      if (user == null) {
        Navigate.next(context, LoginScreen.id);
      } else {
        Navigate.next(context, HomeScreen.id);
      }
    }

    useEffect(() {
      Timer(Duration(seconds: 3), () => _navigateToNextScreen());
      return () {};
    }, []);

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logos/taskify.png'),
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   static String id = "splash_screen";

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     // TODO: implement initState
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var id = Provider.of<UserProvider>(context, listen: false).user.id;
//       getTasks(id);
//     });

//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset('assets/logos/taskify.png'),
//       ),
//     );
//   }
// }
