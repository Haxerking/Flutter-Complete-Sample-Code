import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_complete/database/app_api_services/dashboard_services.dart';
import '../app_globel_data.dart';
import '../common/custom/custom_elevated_button.dart';
import '../common/theme/app_text_style.dart';
import '../screens/auth/model/auth_screen_response_model.dart';
import '../screens/auth/model/logout_user_response_model.dart';
import '../model/app_database_response_model.dart';

class HomeController {
  HomeController._();

  factory HomeController.getInstance() => _instance;
  static final HomeController _instance = HomeController._();
  final DashBoardService _service = DashBoardService();
  bool isDiaologOpen = false;

  Future logoutUser() async {
    dynamic refreshToken =
        await GlobelData().preferenceService.getUserRefreshToken();
    Map<String, dynamic> body = {
      "refresh_token": refreshToken,
    };
    DataBaseResponseModel data = await _service.logoutUser(body);
    if (data.statusCode == 200) {
      UserLogoutResponseModel response =
          UserLogoutResponseModel.fromJson(data.response);
      return response;
    }
  }

  Future sendOtp(String phone) async {
    Map<String, dynamic> body = {
      "phone": phone,
    };
    DataBaseResponseModel data = await _service.sendOtp(body);
    if (data.statusCode == 200) {
      SendOtpScreenResponseModel response =
          SendOtpScreenResponseModel.fromJson(data.response);
      
      return response;
    }
  }

  Future verifyOtp(String phone, String otp) async {
    Map<String, dynamic> body = {"phone": phone, "otp": otp};
    DataBaseResponseModel data = await _service.sendOtp(body);
    if (data.statusCode == 200) {
      SendOtpScreenResponseModel response =
          SendOtpScreenResponseModel.fromJson(data.response);
      return response;
    }
  }

  Future getHostData() async {}
  Future getVisitorData() async {}
  Future getHostListData() async {}
  Future updateVisitorDetails() async {}
  Future updateVisitRecord() async {}
}
