import 'dart:convert';
import 'package:carelan/model/login_model.dart';
import 'package:carelan/model/usertype.dart';
import 'package:carelan/model/verify_otp_model.dart';
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
  if (response.statusCode == 200) {
    debugPrint(response.body);
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
  if (response.statusCode == 200) {
    debugPrint(response.body);
    return VerifyOTPModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<UserType> fetchAlbum() async {
  final response = await http.get(Uri.parse(AppUrl.getUserType));
  debugPrint('-----------usertype --------------');
  //print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return response.body;
    return (jsonDecode(response.body));
    // return UserType.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
