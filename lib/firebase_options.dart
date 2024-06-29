// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// / Default [FirebaseOptions] for use with your Firebase apps.
// /
// / Example:
// / ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
// / ```
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA6PCTxn8NZZQe-Vjjxnf5L2AbxoXXrJK0',
    appId: '1:346657878856:web:0e62e9afef48bf860c797d',
    messagingSenderId: '346657878856',
    projectId: 'taxi-deals',
    authDomain: 'taxi-deals.firebaseapp.com',
    storageBucket: 'taxi-deals.appspot.com',
    measurementId: 'G-H9JBBJH5FF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyQnLfsFpr82jKIGSRhaofW1mJVIvq0y0',
    appId: '1:346657878856:android:0559efc1634aab300c797d',
    messagingSenderId: '346657878856',
    projectId: 'taxi-deals',
    storageBucket: 'taxi-deals.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6wVsAY_IubzG9cKC4EC01xvBrPQzafc0',
    appId: '1:346657878856:ios:6c2877f1e7b977110c797d',
    messagingSenderId: '346657878856',
    projectId: 'taxi-deals',
    storageBucket: 'taxi-deals.appspot.com',
    iosBundleId: 'com.mongokerala.taxi.newuser',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6wVsAY_IubzG9cKC4EC01xvBrPQzafc0',
    appId: '1:346657878856:ios:6c2877f1e7b977110c797d',
    messagingSenderId: '346657878856',
    projectId: 'taxi-deals',
    storageBucket: 'taxi-deals.appspot.com',
    iosBundleId: 'com.mongokerala.taxi.newuser',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA6PCTxn8NZZQe-Vjjxnf5L2AbxoXXrJK0',
    appId: '1:346657878856:web:69b89be1baf769ce0c797d',
    messagingSenderId: '346657878856',
    projectId: 'taxi-deals',
    authDomain: 'taxi-deals.firebaseapp.com',
    storageBucket: 'taxi-deals.appspot.com',
    measurementId: 'G-88YZSVEQE3',
  );
}
