import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAnOm5d9tmDZBNFC-T6cRk2MldS_zLHJP0",
            authDomain: "scale360-b0a54.firebaseapp.com",
            projectId: "scale360-b0a54",
            storageBucket: "scale360-b0a54.appspot.com",
            messagingSenderId: "938272782215",
            appId: "1:938272782215:web:38563313590c89ec5b0522",
            measurementId: "G-E9C687EHYT"));
  } else {
    await Firebase.initializeApp();
  }
}
