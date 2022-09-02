class LoginScreenResponseModel {
   String? refresh;
  String? access;

  LoginScreenResponseModel({this.refresh, this.access});

  LoginScreenResponseModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
