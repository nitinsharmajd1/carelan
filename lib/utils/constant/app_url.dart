class AppUrl {
  static const String liveBaseURL = "https://www.carelan.in/api";

  static const String baseURL = liveBaseURL;
  static const String sendOtp = baseURL + "/send-otp";
  static const String viewOtp = baseURL + "/view-otp";
  static const String verify = baseURL + "/verify-otp";
  static const String getUserType = baseURL + "/get-user-type";
  static const String userRegister = baseURL + "/user-registration";
  static const String getalluserprofile = baseURL + '/get-all-user-profile';
  static const String approve_user_profile = baseURL + '/approve-user-profile';
  static const String reject_user_profile = baseURL + '/reject-user-profile';
}