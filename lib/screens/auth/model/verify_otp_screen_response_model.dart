class VerifyOtpScreenResponseModel {
  bool? success;
  VerifyOtp? response;
  List<String>? errors;

  VerifyOtpScreenResponseModel({this.success, this.response, this.errors});

  VerifyOtpScreenResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'] != null
        ? new VerifyOtp.fromJson(json['response'])
        : null;
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class VerifyOtp {
  AuthData? data;

  VerifyOtp({this.data});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new AuthData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthData {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? emailId;
  String? alternateContact;
  String? companyName;
  bool? isVerified;
  int? counter;

  AuthData(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.emailId,
      this.alternateContact,
      this.companyName,
      this.isVerified,
      this.counter});

  AuthData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    emailId = json['emailId'];
    alternateContact = json['alternateContact'];
    companyName = json['companyName'];
    isVerified = json['isVerified'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['emailId'] = this.emailId;
    data['alternateContact'] = this.alternateContact;
    data['companyName'] = this.companyName;
    data['isVerified'] = this.isVerified;
    data['counter'] = this.counter;
    return data;
  }
}
