import 'dart:convert';

DataBaseResponseModel dataBaseResponseModelFromJson(String str) =>
    DataBaseResponseModel.fromJson(json.decode(str));

String dataBaseResponseModelToJson(DataBaseResponseModel data) =>
    json.encode(data.toJson());

class DataBaseResponseModel {
  DataBaseResponseModel({
    required this.statusCode,
    required this.response,
  });

  final int statusCode;
  final dynamic response;

  factory DataBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      DataBaseResponseModel(
        statusCode: json["statusCode"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "response": response,
      };
}
