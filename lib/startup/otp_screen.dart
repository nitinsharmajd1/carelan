import 'package:carelan/model/verify_otp_model.dart';
import 'package:carelan/service/verify_phoneno.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 0;
  bool _verifyButtonDisable = false;

  final TextEditingController _textEditingController = TextEditingController();

  void startTimer() {
    _start = 30;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    //fetchOtp();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String mobileNumber = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.white,
                    Colors.pinkAccent,
                    Colors.pinkAccent
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo1.jpg',
                    height: 220,
                    width: 220,
                    fit: BoxFit.scaleDown,
                  ),
                  Container(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            color: Colors.white,
                            height: 250,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text("Enter 4 digit OTP Sent to you on " + mobileNumber,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: PinCodeTextField(
                                    controller: _textEditingController,
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: Colors.green.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 4,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length < 4) {
                                          _verifyButtonDisable = true;
                                        } else {
                                          _verifyButtonDisable = false;
                                          // FocusScope.of(context).unfocus();
                                        }
                                      });
                                    },
                                    animationType: AnimationType.fade,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 60,
                                      fieldWidth: 50,
                                      activeFillColor: Colors.black12,
                                    ),
                                    /*blinkWhenObscuring: true,

                                    validator: (v) {
                                      if (v!.length < 3) {
                                        return "I'm from validator";
                                      } else {
                                        return null;
                                      }
                                    },
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 50,
                                      fieldWidth: 40,
                                      activeFillColor: Colors.white,
                                    ),
                                    cursorColor: Colors.black,
                                    animationDuration: Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    errorAnimationController: errorController,
                                    controller: textEditingController,
                                    keyboardType: TextInputType.number,
                                    boxShadows: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    onCompleted: (v) {
                                      print("Completed");
                                    },
                                    // onTap: () {
                                    //   print("Pressed");
                                    // },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        currentText = value;
                                      });
                                    },
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    }*/
                                    //),
                                  ),
                                ),
                                (_start != 0)
                                    ? Text(
                                        "Resend OTP $_start sec",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )
                                    : const Text(
                                        "Resend OTP sec",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                const SizedBox(height: 20),
                                ButtonTheme(
                                  minWidth: 150,
                                  height: 45,
                                  child: RaisedButton(
                                      shape: const StadiumBorder(),
                                      color: Colors.pinkAccent,
                                      child: const Text('Verify'),
                                      splashColor: Colors.pink,
                                      elevation: 6,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        setState(
                                            () => _verifyButtonDisable = false);
                                        verifyOtp(
                                          mobile: mobileNumber,
                                          otp: _textEditingController.text,

                                        ).then((value) {
                                          setState(() =>
                                              _verifyButtonDisable = true);
                                          VerifyOTPModel verifyOTPModel = value;
                                          print(verifyOTPModel.status);
                                          if (verifyOTPModel.status == 0) {
                                            Navigator.pushNamed(
                                                context, '/Register',
                                                arguments: mobileNumber);
                                          } else if(verifyOTPModel.status == 1){
                                            Navigator.pushNamed(
                                                context, '/homapage',
                                                arguments: mobileNumber);

                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                            //}
                          )),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
