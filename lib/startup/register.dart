import 'dart:math';

import 'package:carelan/model/registermodel.dart';
import 'package:carelan/model/usertype.dart';
import 'package:carelan/service/verify_phoneno.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? _value;
 final items = ['Doctor', 'Central team', 'Care buddy', 'Accountant'];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();




    // getUserType().then((value) {
    //
    //   print(value);
    //
    //   UserType userModel = value;
    //
    //   if (userModel.status == "1") {
    //
    //     print(userModel.userTypes);
    //     //print(userModel.userTypes);
    //   }
    // });

  }

  @override
  Widget build(BuildContext context) {
    final String mobileNumber = ModalRoute.of(context)!.settings.arguments as String;
    print(mobileNumber);
    // textField(String lblTxt, String hntTxt) {
    //   return Container(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: TextField(
    //         controller: _valueController,
    //         decoration: InputDecoration(
    //           border: OutlineInputBorder(),
    //           labelText: lblTxt,
    //           hintText: hntTxt,
    //         ),
    //       ),
    //     ),
    //   );
    // }

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
                                DropdownButton<String>(
                                  items:
                                  //items.map(buildMenuItem()).toList(),
                                  [
                                    DropdownMenuItem<String>(
                                      child: Text('Doctor'),
                                      value: "1",
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Field Worker'),
                                      value: '2',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Accountant'),
                                      value: '3',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Customer'),
                                      value: '4',
                                    ),
                                ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                  hint: Text('--Select User Type--'),
                                  value: _value,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Name',
                                      hintText: 'Enter your name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText: 'Enter email',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _addressController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Address',
                                      hintText: 'Address',
                                    ),
                                  ),
                                ),
                                // textField('Name', 'Enter your name',),
                                // textField('Email', 'Email'),
                                // textField('Address', 'Address'),
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
                                    onPressed: () {
                                      print('-----------------');
                                      print(mobileNumber);
                                      print(_value);
                                      print(_nameController.text);
                                      print(_emailController.text);
                                      print(_addressController.text);

                                      register(
                                          user_type : '$_value',
                                          name : _nameController.text,
                                          email : _emailController.text,
                                          mobile : mobileNumber,
                                          address : _addressController.text

                                      ).then((value) {
                                        UserRegisterModel userRegisterModel = value;
                                        print(userRegisterModel.status);
                                        if (userRegisterModel.status == 1) {
                                          var message = userRegisterModel.msg as String;
                                          showAlertDialog(context, message);
                                        }
                                      });
                                    },
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

 showAlertDialog(BuildContext context, String msg) {

      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Confirm")),
        content: Text(msg),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
