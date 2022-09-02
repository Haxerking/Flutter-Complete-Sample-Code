// ignore_for_file: unnecessary_question_mark

class UserLogoutResponseModel {
  bool? success;
  dynamic? payload;
  String? code;
  Error? error;

  UserLogoutResponseModel({this.success, this.payload, this.code, this.error});

  UserLogoutResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payload = json['payload'];
    code = json['code'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['payload'] = payload;
    data['code'] = code;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  dynamic? code;
  String? message;
  dynamic? description;

  Error({this.code, this.message, this.description});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['description'] = description;
    return data;
  }
}
