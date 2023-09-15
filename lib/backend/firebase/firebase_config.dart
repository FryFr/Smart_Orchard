import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAbMXo0V4HBBIfEwse0Ih1IU9SPQjd2dWo",
            authDomain: "smart-orchard.firebaseapp.com",
            projectId: "smart-orchard",
            storageBucket: "smart-orchard.appspot.com",
            messagingSenderId: "939075945960",
            appId: "1:939075945960:web:00975c4f67a3cf1de5905d",
            measurementId: "G-CRSY8B5C91"));
  } else {
    await Firebase.initializeApp();
  }
}
