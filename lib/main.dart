import 'package:flutter/material.dart';
// import 'package:onbording_screen/onboarding/on_boarding.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onbording_screen/auth_page.dart';
import 'package:onbording_screen/sign_in/sign_in.dart';
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
      title: 'ON BORDING SCREEN',
      theme: ThemeData.light(useMaterial3: true),
      // home:  const Onboarding(),
      home: AuthPage(),
    );
  }
}
