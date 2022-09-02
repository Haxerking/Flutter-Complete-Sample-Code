// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:core';
import 'package:module_complete/screens/auth/model/verify_otp_screen_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/model/login_screen_response_model.dart';
import '../screens/home/model/login_response_model.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;
  static final PreferenceService _instance = PreferenceService._();
  static const String USER_LOGIN_DATA = 'USER_LOGIN_DATA';
  static const String VISITOR_DATA = 'VISITOR_DATA';
  static const String CURRENT_ROUTE = 'CURRENT_ROUTE';
  static const String USER_ACESS_TOKEN = 'USER_ACESS_TOKEN';
  static const String USER_REFRESH_TOKEN = 'USER_REFRESH_TOKEN';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  clear() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  void setLoginResponse(LoginScreenResponseModel loginResponseModel) async {
    (await _getInstance()).setString(
        PreferenceService.USER_LOGIN_DATA, jsonEncode(loginResponseModel));
  }

  Future<dynamic> getLoginResponse() async {
    dynamic data =
        (await _getInstance()).getString(PreferenceService.USER_LOGIN_DATA);
    if (data == null) {
      return null;
    } else {
      LoginScreenResponseModel loginResponseModel =
          LoginScreenResponseModel.fromJson(jsonDecode(data));
      return loginResponseModel;
    }
  }

  void setVisitorDetails(VerifyOtpScreenResponseModel visitorDetails) async {
    (await _getInstance()).setString(
        PreferenceService.VISITOR_DATA, jsonEncode(visitorDetails));
  }

  Future<dynamic> getVisitorDetails() async {
    dynamic data =
        (await _getInstance()).getString(PreferenceService.VISITOR_DATA);
    if (data == null) {
      return null;
    } else {
      VerifyOtpScreenResponseModel visitordetails =
          VerifyOtpScreenResponseModel.fromJson(jsonDecode(data));
      return visitordetails;
    }
  }

  void setUserAccessToken(dynamic accessToken) async {
    (await _getInstance())
        .setString(PreferenceService.USER_ACESS_TOKEN, accessToken);
  }

  void setUserRefreshToken(dynamic refreshToken) async {
    (await _getInstance())
        .setString(PreferenceService.USER_REFRESH_TOKEN, refreshToken);
  }

  Future<String?> getUserAccessToken() async {
    final dynamic accessToken =
        (await _getInstance()).getString(PreferenceService.USER_ACESS_TOKEN);
    return accessToken;
  }

  Future<String?> getUserRefreshToken() async {
    final dynamic refreshToken =
        (await _getInstance()).getString(PreferenceService.USER_REFRESH_TOKEN);
    return refreshToken;
  }
}
