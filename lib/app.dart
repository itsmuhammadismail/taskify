import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskify/modules/user/screens/splash/splash_screen.dart';
import 'package:taskify/shared/routes/routes.dart';
import 'package:taskify/shared/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Taskify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      initialRoute: SplashScreen.id,
      routes: Routes.routes,
    );
  }
}
