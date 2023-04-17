import 'package:firebase_core/firebase_core.dart';
import 'package:admit_kard/authentication/login.dart';
import 'package:admit_kard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
          apiKey: "AIzaSyCCurmpC9L1K6GT1Gl-1Ls0HXKQpHEObw8",
      projectId: "admitkard-850b6",
      messagingSenderId: "147737096198",
      appId: "1:147737096198:web:2b34d03e144263deaf5387"
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdmitKard',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

