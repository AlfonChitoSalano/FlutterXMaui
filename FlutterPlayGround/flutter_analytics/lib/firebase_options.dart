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
    apiKey: 'AIzaSyD57dW_1D8uMhEsRFan7txNHtiiPov5QvY',
    appId: '1:519985448463:web:b4f9770496a4e7de06857a',
    messagingSenderId: '519985448463',
    projectId: 'analyticsflutter',
    authDomain: 'analyticsflutter.firebaseapp.com',
    storageBucket: 'analyticsflutter.appspot.com',
    measurementId: 'G-B030KZG2F2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwczfGQrTKm-1MdWb-d5fImEAtFwx4sI8',
    appId: '1:519985448463:android:0d06b2e4a04b589e06857a',
    messagingSenderId: '519985448463',
    projectId: 'analyticsflutter',
    storageBucket: 'analyticsflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9eprUiOwsueyprUKvZkotGWmGef8MLj4',
    appId: '1:519985448463:ios:33d7cd06d6cf36e006857a',
    messagingSenderId: '519985448463',
    projectId: 'analyticsflutter',
    storageBucket: 'analyticsflutter.appspot.com',
    iosClientId: '519985448463-o1hmk3qdo1cr6lbtqkhcv26t0sik98an.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAnalytics',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9eprUiOwsueyprUKvZkotGWmGef8MLj4',
    appId: '1:519985448463:ios:33d7cd06d6cf36e006857a',
    messagingSenderId: '519985448463',
    projectId: 'analyticsflutter',
    storageBucket: 'analyticsflutter.appspot.com',
    iosClientId: '519985448463-o1hmk3qdo1cr6lbtqkhcv26t0sik98an.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAnalytics',
  );
}
