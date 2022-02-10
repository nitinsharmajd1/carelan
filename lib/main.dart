import 'package:carelan/startup/httpPostExaple.dart';
import 'package:carelan/startup/login_Screen.dart';
import 'package:carelan/startup/otp_Screen.dart';
import 'package:carelan/startup/register.dart';
import 'package:carelan/startup/splasshscreen.dart';
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
      home: const SplashSchreen(),
      routes: {
        '/OtpScreen' : (context) => OtpScreen(),
        '/Register' : (context) => Register()
      },
    );
  }
}
