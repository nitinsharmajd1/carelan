import 'dart:convert';
import 'package:carelan/model/login.dart';
import 'package:carelan/model/usertype.dart';
import 'package:carelan/model/verifyOtp.dart';
import 'package:carelan/utils/constant/app_url.dart';
import 'package:http/http.dart' as http;

Future<LoginbyMobile> fetchOtp(String mobile) async {
  Map<String, String> body = {
    'mobile': mobile,
  };
  http.Response response = await http.post(
    Uri.parse(AppUrl.sendOtp),
    body: body,
  );
  if (response.statusCode == 200) {
    print(response.body);
    return LoginbyMobile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<VerifyMobileOTP> verifyOtp() async {
  Map<String, String> body = {'mobile': '9897424156', 'otp': '2655'};
  http.Response response = await http.post(
    Uri.parse(AppUrl.viewOtp),
    body: body,
  );
  print(response);
  if (response.statusCode == 200) {
    print(response.body);
    return VerifyMobileOTP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<UserType> fetchAlbum() async {
  final response = await http.get(Uri.parse(AppUrl.getusertype));
print('-----------usertype --------------');
  //print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return response.body;
    //return (jsonDecode(response.body));
    return UserType.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
