// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLFBk8ZN39E8Q8EfkRDgT_WnkUPack0Xs',
    appId: '1:485671429839:android:33c36deaa351f40cf7b9ba',
    messagingSenderId: '485671429839',
    projectId: 'handy-helper-be648',
    storageBucket: 'handy-helper-be648.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzY4ARJFimMMoWngcdo4w55sMBfql-d9o',
    appId: '1:485671429839:ios:51636c29562800ddf7b9ba',
    messagingSenderId: '485671429839',
    projectId: 'handy-helper-be648',
    storageBucket: 'handy-helper-be648.appspot.com',
    iosBundleId: 'com.example.handyHelperMain',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBP7uJqv36RKqvzYfLjHEYsW3z1kYJeziA',
    appId: '1:485671429839:web:60bde487434bd51df7b9ba',
    messagingSenderId: '485671429839',
    projectId: 'handy-helper-be648',
    authDomain: 'handy-helper-be648.firebaseapp.com',
    storageBucket: 'handy-helper-be648.appspot.com',
  );
}
