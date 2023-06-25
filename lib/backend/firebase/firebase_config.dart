import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASV-UsK9VSIcdtwJ1Bo-lHdavmlya4kBU",
            authDomain: "binosophy.firebaseapp.com",
            projectId: "binosophy",
            storageBucket: "binosophy.appspot.com",
            messagingSenderId: "283035921506",
            appId: "1:283035921506:web:23c424799e13736b75b53b",
            measurementId: "G-NBMPJCX1J7"));
  } else {
    await Firebase.initializeApp();
  }
}
