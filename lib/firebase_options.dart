// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCjZSlxBI3lXZ_0AJLEU94fvZF5qU-Ar_E',
    appId: '1:270182217406:web:f3d6a61020b9fcc47cd0ef',
    messagingSenderId: '270182217406',
    projectId: 'taskify-11',
    authDomain: 'taskify-11.firebaseapp.com',
    storageBucket: 'taskify-11.appspot.com',
    measurementId: 'G-Y27WW5JQM7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8vhjB7_-M0rSsulKTvvMNoUHPgl1RJ5s',
    appId: '1:270182217406:android:b70af159cb0a9ef97cd0ef',
    messagingSenderId: '270182217406',
    projectId: 'taskify-11',
    storageBucket: 'taskify-11.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7sPZyFyK86WG1TJX-KjfIJRkcPsHE6CY',
    appId: '1:270182217406:ios:575b04e26ba265547cd0ef',
    messagingSenderId: '270182217406',
    projectId: 'taskify-11',
    storageBucket: 'taskify-11.appspot.com',
    iosClientId: '270182217406-lrn4b22lm62eugq5k02vvhfbnipp1300.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7sPZyFyK86WG1TJX-KjfIJRkcPsHE6CY',
    appId: '1:270182217406:ios:fabd3ae7b15a09267cd0ef',
    messagingSenderId: '270182217406',
    projectId: 'taskify-11',
    storageBucket: 'taskify-11.appspot.com',
    iosClientId: '270182217406-ac7538n997b90iv7mjd6o0kempob1n4h.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskify.RunnerTests',
  );
}
