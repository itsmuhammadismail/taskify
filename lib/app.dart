import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taskify/firebase_options.dart';
import 'package:taskify/modules/user/screens/splash/splash_screen.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/providers/chat_provider.dart';
import 'package:taskify/shared/providers/credentials_provider.dart';
import 'package:taskify/shared/providers/running_tasks_provider.dart';
import 'package:taskify/shared/providers/todo_tasks_provider.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/routes/routes.dart';
import 'package:taskify/shared/theme/theme_data.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => RunningTaskProvider()),
        ChangeNotifierProvider(create: (_) => TodoTaskProvider()),
        ChangeNotifierProvider(create: (_) => CredentialsProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Taskify',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: SplashScreen.id,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
