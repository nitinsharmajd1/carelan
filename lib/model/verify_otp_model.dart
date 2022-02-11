class VerifyOTPModel {
  String? status;
  List<Details>? details;

  VerifyOTPModel({this.status, this.details});

  VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }
}

class Details {
  String? mobile;
  String? otp;

  Details({this.mobile, this.otp});

  Details.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    otp = json['otp'];
  }
}
