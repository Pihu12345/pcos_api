import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBpf9oGcjymD2tydcA31kXAMpH9rRLJhNI",
            authDomain: "ova-sense-y6ma8s.firebaseapp.com",
            projectId: "ova-sense-y6ma8s",
            storageBucket: "ova-sense-y6ma8s.firebasestorage.app",
            messagingSenderId: "351495096605",
            appId: "1:351495096605:web:30daff3227531486feb9f4"));
  } else {
    await Firebase.initializeApp();
  }
}
