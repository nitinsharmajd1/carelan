import 'dart:math';

import 'package:carelan/service/verify_phoneno.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = '--Select user type--';
  List<String> items = ['Doctor', 'Central team', 'Care buddy', 'Accountant'];
  //List<String> items = fetchAlbum() as List<String>;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(fetchAlbum());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    height: 0,
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            color: Colors.white,
                            height: 400,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Register with us",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButton(
                                  hint: Text('--Select user type--',
                                      style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  ),
                                  items: items.map((e) => DropdownMenuItem(
                                      child: Container(
                                      alignment: Alignment.centerLeft,
                                        child: Text(e,style: TextStyle(fontSize: 18),),
                                      ),
                                  value: dropdownValue,
                                  )).toList(),
                                  onChanged: (newvalue) => newvalue = dropdownValue,
                                ),
                                textField('Name', 'Enter your name'),
                                textField('Email', 'Email'),
                                textField('Address', 'Address'),
                                SizedBox(height: 20),
                                ButtonTheme(
                                  minWidth: 150,
                                  height: 45,
                                  child: RaisedButton(
                                    shape: const StadiumBorder(),
                                    color: Colors.pinkAccent,
                                    child: Text('Register'),
                                    splashColor: Colors.pink,
                                    elevation: 6,
                                    textColor: Colors.white,
                                    onPressed: () {},
                                    // _verifyButtonDisable
                                    //     ? null
                                    //     : () => Navigator.pushNamed(
                                    //     context, '/Register')
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

   textField(String lblTxt, String hntTxt) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: lblTxt,
            hintText: hntTxt,
          ),
        ),
      ),
    );
  }
}
