// ignore_for_file: constant_identifier_names

import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;
  static final PreferenceService _instance = PreferenceService._();
  static const String USER_LOGIN_DATA = 'USER_LOGIN_DATA';
  static const String CURRENT_ROUTE = 'CURRENT_ROUTE';
  static const String USER_ACESS_TOKEN = 'USER_ACESS_TOKEN';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  clear() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
  
  void setUserAccessToken(dynamic accessToken) async {
    (await _getInstance())
        .setString(PreferenceService.USER_ACESS_TOKEN, accessToken);
  }

  Future<String?> getUserAccessToken() async {
    final dynamic accessToken =
        (await _getInstance()).getString(PreferenceService.USER_ACESS_TOKEN);
    return accessToken;
  }
}