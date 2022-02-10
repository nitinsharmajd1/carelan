import 'dart:convert';

import 'package:carelan/service/verify_phoneno.dart';
import 'package:carelan/utils/constant/app_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  late final String mobile;
  final TextEditingController _controller = TextEditingController();
  //final String _controller = TextEditingController() as String;

  String _errorText = '';
  bool _nextButtonDisable = true;

  // ignore: must_call_super
  void initState() {
    super.initState();
    //getOtpByMobile();
  }

  Widget build(BuildContext context) {

    final usernameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.phone,
      controller: _controller,
      textInputAction: TextInputAction.send,
      onSaved: (value) {
        mobile = value!;
      },
      onChanged: (text) {
        setState(() {
          if (text.length < 10) {
            _nextButtonDisable = true;
          } else {
            _nextButtonDisable = false;
            FocusScope.of(context).unfocus();
          }
        });
      },
      validator: (value) {
        setState(() {
          _errorText = validation(value!, TextFormFieldType.PHONE)!;
        });
        return _errorText;
      },
      maxLength: 10,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          labelText: 'Mobile no'),
    );

    // ignore: prefer_function_declarations_over_variables
    var sendOtpByMobile = () {
     final formkey = _formKey.currentState;
     if(formkey!.validate()){
       formkey.save();
       //auth.register(mobile)
     }
    };

    return Scaffold(
      body: SafeArea(
        child:
        //FutureBuilder(future: fetchOtp(),builder: (context, snapshot) {
           //if(snapshot.connectionState != ConnectionState.waiting){

            //return SingleChildScrollView(
         SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
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
                            height: 200,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  AppStrings.enterMobiletologin,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Form(key: _formKey, child: usernameField),
                                ),
                                ButtonTheme(
                                  minWidth: 150,
                                  height: 45,
                                  child: RaisedButton(
                                      shape: const StadiumBorder(),
                                      color: Colors.pinkAccent,
                                      child: Text('Next'),
                                      splashColor: Colors.pink,
                                      elevation: 6,
                                      textColor: Colors.white,
                                      onPressed:
                                          //(){
                                        //String mobileno = _controller.text;
//                                         print('-------------printv ------');
                                          //fetchOtp(mobileno);
                                       // var otpRecponse = fetchOtp(mobileno);
                                       // print(otpRecponse);
                                       //  print('--------------otpResponse-------');
                                        //print(otpRecponse["status"]);



                                        // if(otpRecponse.status){
                                        // } else {}

                                     // }
                                      _nextButtonDisable ? null : () =>
                                        Navigator.pushNamed(context, '/OtpScreen')
                                        //fetchOtp();
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
           //);
          //}
        ),
      ),
    );
  }

  String? validation(String value, TextFormFieldType type) {
    if (value.isEmpty) {
      return "Mobile is not empty";
    }
    if (type == TextFormFieldType.PHONE && value.length < 10) {
      return "Invalid mobile number";
    }
    return null;
  }
}

enum TextFormFieldType {
  PHONE,
}
