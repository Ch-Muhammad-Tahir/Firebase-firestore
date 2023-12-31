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
    apiKey: 'AIzaSyB9iVyO20BuYmJsdkC4Ye-_RmVVlM15yCI',
    appId: '1:801409129146:web:320fa314af44dc2fbdc083',
    messagingSenderId: '801409129146',
    projectId: 'fir-firestore-project-91319',
    authDomain: 'fir-firestore-project-91319.firebaseapp.com',
    storageBucket: 'fir-firestore-project-91319.appspot.com',
    measurementId: 'G-4B5WJLPECQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4iB6P_F_p8sxEWQcT3yizZs0er27Q3Xg',
    appId: '1:801409129146:android:bda5fcb04435d7f1bdc083',
    messagingSenderId: '801409129146',
    projectId: 'fir-firestore-project-91319',
    storageBucket: 'fir-firestore-project-91319.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB-5F_LVhOgHdqw1ZznhX7jrl0GFrv4kQ',
    appId: '1:801409129146:ios:910cb1901075e2a5bdc083',
    messagingSenderId: '801409129146',
    projectId: 'fir-firestore-project-91319',
    storageBucket: 'fir-firestore-project-91319.appspot.com',
    iosClientId: '801409129146-1egh1g2a8ss2qqgblle2e3ac18ae38k2.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseFirestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDB-5F_LVhOgHdqw1ZznhX7jrl0GFrv4kQ',
    appId: '1:801409129146:ios:910cb1901075e2a5bdc083',
    messagingSenderId: '801409129146',
    projectId: 'fir-firestore-project-91319',
    storageBucket: 'fir-firestore-project-91319.appspot.com',
    iosClientId: '801409129146-1egh1g2a8ss2qqgblle2e3ac18ae38k2.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseFirestore',
  );
}
