class VerifyMobileOTP {
  // final String title;
  final String mobile;
  final String otp;

  const VerifyMobileOTP({required this.mobile, required this.otp});

  factory VerifyMobileOTP.fromJson(Map<String, dynamic> json){
   return const VerifyMobileOTP(
        mobile: "9897424156",
        otp : "9898"
    );
  }
}