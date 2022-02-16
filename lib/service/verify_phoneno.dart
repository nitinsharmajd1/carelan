import 'dart:convert';
import 'package:carelan/model/login_model.dart';
import 'package:carelan/model/registermodel.dart';
import 'package:carelan/model/usertype.dart';
import 'package:carelan/model/verify_otp_model.dart';
import 'package:carelan/startup/register.dart';
import 'package:carelan/utils/constant/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<LoginByMobileModel> fetchOtp({
  required String mobile,
}) async {
  Map<String, String> body = {
    'mobile': mobile,
  };
  http.Response response = await http.post(
    Uri.parse(AppUrl.sendOtp),
    body: body,
  );
  print(mobile);
  print(response.body);
  if (response.statusCode == 200) {
    return LoginByMobileModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<VerifyOTPModel> verifyOtp({
  required String mobile,
  required String otp,
}) async {
  Map<String, String> body = {
    'mobile': mobile,
    'otp': otp,
  };
  http.Response response = await http.post(
    Uri.parse(AppUrl.viewOtp),
    body: body,
  );
  print(response.body);
  if (response.statusCode == 200) {
    debugPrint(response.body);
    return VerifyOTPModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<UserType> getUserType() async {
  http.Response response = await http.get(Uri.parse(AppUrl.getUserType));
  if (response.statusCode == 200) {
    return UserType.fromJson(jsonDecode(response.body));
    // return UserType.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<UserRegisterModel> register({
  required String user_type, name, email, mobile, address
}) async {
  Map<String, String> body = {
    'user_type': user_type,
    'name': name,
    'email': email,
    'mobile': mobile,
    'address': address
  };
  print('--------only body------');
  print(body);

  http.Response response = await http.post(
    Uri.parse(AppUrl.userRegister),
    body: body,
  );

  print('---------body------');
  print(response.body);


  if (response.statusCode == 200) {
    return UserRegisterModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
