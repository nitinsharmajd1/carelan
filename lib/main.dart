import 'package:carelan/startup/otp_screen.dart';
import 'package:carelan/startup/register.dart';
import 'package:carelan/startup/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carelan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/OtpScreen': (context) => const OtpScreen(),
        '/Register': (context) => const Register()
      },
    );
  }
}
