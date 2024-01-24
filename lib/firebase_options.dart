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
    apiKey: 'AIzaSyDjPRf28yy5QWL3hntOndiMcWhwS7b9v6o',
    appId: '1:903011201277:web:91de9c4788c33470a34e94',
    messagingSenderId: '903011201277',
    projectId: 'chatauth-3d0e7',
    authDomain: 'chatauth-3d0e7.firebaseapp.com',
    storageBucket: 'chatauth-3d0e7.appspot.com',
    measurementId: 'G-Z8YMWJ6291',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsiRo3z0OoGJC7kokuOTNUZqjiEtBS3aA',
    appId: '1:903011201277:android:387b34c4efd1215fa34e94',
    messagingSenderId: '903011201277',
    projectId: 'chatauth-3d0e7',
    storageBucket: 'chatauth-3d0e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMVZIVLQYJH8z84VBEr311ASWz96R0S_g',
    appId: '1:903011201277:ios:5ed28c88d76e7f7ba34e94',
    messagingSenderId: '903011201277',
    projectId: 'chatauth-3d0e7',
    storageBucket: 'chatauth-3d0e7.appspot.com',
    iosBundleId: 'com.example.airochat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMVZIVLQYJH8z84VBEr311ASWz96R0S_g',
    appId: '1:903011201277:ios:46de32a4c335b2b2a34e94',
    messagingSenderId: '903011201277',
    projectId: 'chatauth-3d0e7',
    storageBucket: 'chatauth-3d0e7.appspot.com',
    iosBundleId: 'com.example.airochat.RunnerTests',
  );
}
