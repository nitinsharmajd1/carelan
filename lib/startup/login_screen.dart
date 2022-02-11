import 'package:carelan/model/login_model.dart';
import 'package:carelan/service/verify_phoneno.dart';
import 'package:carelan/utils/constant/app_string.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final String mobile;
  final TextEditingController _controller = TextEditingController();
  //final String _controller = TextEditingController() as String;

  String _errorText = '';
  bool _nextButtonDisable = true;

  @override
  void initState() {
    super.initState();
    //getOtpByMobile();
  }

  @override
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
            // FocusScope.of(context).unfocus();
          }
        });
      },
      validator: (value) {
        setState(() {
          _errorText = validation(value!, TextFormFieldType.phone)!;
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
      final formKey = _formKey.currentState;
      if (formKey!.validate()) {
        formKey.save();
        //auth.register(mobile)
      }
    };

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
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
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
                                  child: const Text('Next'),
                                  splashColor: Colors.pink,
                                  elevation: 6,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    fetchOtp(
                                      mobile: _controller.text,
                                    ).then((value) {
                                      debugPrint("value ======> $value");
                                      LoginByMobileModel loginByMobileModel =
                                          value;
                                      if (loginByMobileModel.status == 1) {
                                        Navigator.pushNamed(
                                            context, '/OtpScreen',
                                            arguments: _controller.text);
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        loginByMobileModel.msg ?? "",
                                      )));
                                    });
                                  }),
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
    if (type == TextFormFieldType.phone && value.length < 10) {
      return "Invalid mobile number";
    }
    return null;
  }
}

enum TextFormFieldType {
  phone,
}
