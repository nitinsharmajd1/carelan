import 'package:carelan/home/admin_deshboard.dart';
import 'package:carelan/home/doctor_deshboard.dart';
import 'package:carelan/startup/httpPostExaple.dart';
import 'package:carelan/startup/otp_screen.dart';
import 'package:carelan/startup/register.dart';
import 'package:carelan/startup/splash_screen.dart';
import 'package:flutter/material.dart';

import 'home/doctor/add_patient.dart';

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
      home: DoctorDeshboard(),//const SplashScreen(),
      routes: {
        '/OtpScreen': (context) => const OtpScreen(),
        '/Register': (context) => const Register(),
        '/adminDeshboard': (context) => const HomePage(),
        '/doctorDeshboard' : (context) => const DoctorDeshboard(),
        '/addPatient' : (contxt) => const AddPatient()
      },
    );
  }
}
