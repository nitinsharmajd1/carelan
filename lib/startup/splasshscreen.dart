import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'login_Screen.dart';

class SplashSchreen extends StatefulWidget {
  const SplashSchreen({Key? key}) : super(key: key);

  @override
  State<SplashSchreen> createState() => _SplashSchreenState();
}

class _SplashSchreenState extends State<SplashSchreen> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    print("object");
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoginScreen()
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orangeAccent, Colors.pinkAccent])),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(125),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    height: 250,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "1.0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ])),
        ),
      ),
    );
  }
}
