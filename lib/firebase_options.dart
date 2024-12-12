import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

@NowaGenerated()
class DefaultFirebaseOptions {
  static FirebaseOptions web = const FirebaseOptions(
    apiKey: 'AIzaSyDxu7rwFEaSRNVEq0UqcSEDcYjCGgI0YB8',
    appId: '1:59988971110:web:3f340e3ed5ba869af667a7',
    messagingSenderId: '59988971110',
    projectId: 'tenatest-b4d38',
    authDomain: 'tenatest-b4d38.firebaseapp.com',
    storageBucket: 'tenatest-b4d38.appspot.com',
    measurementId: 'G-08F1VM5YHK',
  );

  static FirebaseOptions ios = const FirebaseOptions(
    apiKey: 'AIzaSyChlFXCjjaeAoRiPPb3051cg1_StuLlqH0',
    appId: '1:59988971110:ios:aebb4b65fae3bc32f667a7',
    messagingSenderId: '59988971110',
    projectId: 'tenatest-b4d38',
    storageBucket: 'tenatest-b4d38.appspot.com',
    androidClientId: '',
    iosBundleId: 'com.myapp.gyno',
  );

  static FirebaseOptions android = const FirebaseOptions(
    apiKey: 'AIzaSyA3wj3XdOR414GK13QgXvHTD6QkxpDg-Qk',
    appId: '1:59988971110:android:1fd6b25d61123f4df667a7',
    messagingSenderId: '59988971110',
    projectId: 'tenatest-b4d38',
    storageBucket: 'tenatest-b4d38.appspot.com',
  );

  static FirebaseOptions? get currentPlatform {
    if (NPlatform.isWeb) {
      return web;
    } else {
      if (NPlatform.isAndroid) {
        return android;
      }
    }
    if (NPlatform.isIOS || NPlatform.isMacOs) {
      return ios;
    }
    return null;
  }
}
