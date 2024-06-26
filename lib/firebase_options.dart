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
    apiKey: 'AIzaSyADAFjx9YCdp5UVNDgSK58Qnan7-k-0h-U',
    appId: '1:307822648980:web:b4f9ce7f82d6dddb555e81',
    messagingSenderId: '307822648980',
    projectId: 'chat-app-5b64d',
    authDomain: 'chat-app-5b64d.firebaseapp.com',
    storageBucket: 'chat-app-5b64d.appspot.com',
    measurementId: 'G-FD9LP5BHGS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrRuUi4wr2uejIqGLWuhaPdks_FVYMs7w',
    appId: '1:307822648980:android:0ec11965db0d52aa555e81',
    messagingSenderId: '307822648980',
    projectId: 'chat-app-5b64d',
    storageBucket: 'chat-app-5b64d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgDhWediXOZR3ajLLHhWyxoQ8eOQOm5tk',
    appId: '1:307822648980:ios:c165339d290b57c1555e81',
    messagingSenderId: '307822648980',
    projectId: 'chat-app-5b64d',
    storageBucket: 'chat-app-5b64d.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgDhWediXOZR3ajLLHhWyxoQ8eOQOm5tk',
    appId: '1:307822648980:ios:6cb4d8f228d6c989555e81',
    messagingSenderId: '307822648980',
    projectId: 'chat-app-5b64d',
    storageBucket: 'chat-app-5b64d.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
