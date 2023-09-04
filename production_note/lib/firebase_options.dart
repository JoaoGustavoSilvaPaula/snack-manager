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
    apiKey: 'AIzaSyAwTEJf3I7SFb5NiUKTnKIpjNr-p1DR21A',
    appId: '1:678226943876:web:49b8ee687d5cd598bd07d1',
    messagingSenderId: '678226943876',
    projectId: 'minig-6d2c4',
    authDomain: 'minig-6d2c4.firebaseapp.com',
    storageBucket: 'minig-6d2c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyah5xOpWS6jlKb4RajKe3j7nJhn0yToQ',
    appId: '1:678226943876:android:d5805f3060c47491bd07d1',
    messagingSenderId: '678226943876',
    projectId: 'minig-6d2c4',
    storageBucket: 'minig-6d2c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdtchOsFR499Y3hCFuO-F6fXbMZk4gybc',
    appId: '1:678226943876:ios:a5c63dd2609e3656bd07d1',
    messagingSenderId: '678226943876',
    projectId: 'minig-6d2c4',
    storageBucket: 'minig-6d2c4.appspot.com',
    iosClientId: '678226943876-hmmup735teu83np8up7ihbcvboe5n0l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.productionNote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdtchOsFR499Y3hCFuO-F6fXbMZk4gybc',
    appId: '1:678226943876:ios:c358d3d329cdc9e1bd07d1',
    messagingSenderId: '678226943876',
    projectId: 'minig-6d2c4',
    storageBucket: 'minig-6d2c4.appspot.com',
    iosClientId: '678226943876-5nq1l0qv76402lmoqu5hcgvn0q5t576t.apps.googleusercontent.com',
    iosBundleId: 'com.example.productionNote.RunnerTests',
  );
}
