import 'package:class13firebaseauth/home.dart';
import 'package:class13firebaseauth/login.dart';
import 'package:class13firebaseauth/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Register()),
      routes: {
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(
              uid: "",
            ),
      },
    );
  }
}
