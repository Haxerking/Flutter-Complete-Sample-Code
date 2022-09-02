class SendOtpScreenResponseModel {
  List<String>? sMSApiResponse;

  SendOtpScreenResponseModel({this.sMSApiResponse});

  SendOtpScreenResponseModel.fromJson(Map<String, dynamic> json) {
    sMSApiResponse = json['SMS_api_response'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SMS_api_response'] = sMSApiResponse;
    return data;
  }
}
