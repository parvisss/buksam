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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxZKjkzH5Q2g5WafwvCS5P6o_D8_5G_qI',
    appId: '1:320712667406:android:401d578ec7b853d876e75f',
    messagingSenderId: '320712667406',
    projectId: 'buksam-8dabc',
    storageBucket: 'buksam-8dabc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb-Z-ZN3FRieLPnvsZOhE_q826_pG9pvQ',
    appId: '1:320712667406:ios:9923969720fc63e276e75f',
    messagingSenderId: '320712667406',
    projectId: 'buksam-8dabc',
    storageBucket: 'buksam-8dabc.appspot.com',
    iosBundleId: 'com.example.buksamFlutterPracticum',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCOC6gwlDcETjtv1qHMk9v3-xq9xIFXe78',
    appId: '1:320712667406:web:37a3ef46e5d0a62a76e75f',
    messagingSenderId: '320712667406',
    projectId: 'buksam-8dabc',
    authDomain: 'buksam-8dabc.firebaseapp.com',
    storageBucket: 'buksam-8dabc.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb-Z-ZN3FRieLPnvsZOhE_q826_pG9pvQ',
    appId: '1:320712667406:ios:9923969720fc63e276e75f',
    messagingSenderId: '320712667406',
    projectId: 'buksam-8dabc',
    storageBucket: 'buksam-8dabc.appspot.com',
    iosBundleId: 'com.example.buksamFlutterPracticum',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOC6gwlDcETjtv1qHMk9v3-xq9xIFXe78',
    appId: '1:320712667406:web:37a3ef46e5d0a62a76e75f',
    messagingSenderId: '320712667406',
    projectId: 'buksam-8dabc',
    authDomain: 'buksam-8dabc.firebaseapp.com',
    storageBucket: 'buksam-8dabc.appspot.com',
  );

}