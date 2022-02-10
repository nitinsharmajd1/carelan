class LoginbyMobile {
  final String mobile;
  const LoginbyMobile({required this.mobile});
  factory LoginbyMobile.fromJson(Map<String, dynamic> json) {
    return const LoginbyMobile(
        mobile: "9897424156"
    );
  }
}
