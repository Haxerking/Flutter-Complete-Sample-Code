import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../app_globel_data.dart';
import '../common/app_size_helper.dart';
import '../common/custom/custom_elevated_button.dart';
import '../common/theme/app_text_style.dart';
import '../database/app_api_services/app_auth_services.dart';
import '../screens/home/splash_screen.dart';

class AuthController {
  AuthController._();

  factory AuthController.getInstance() => _instance;
  static final AuthController _instance = AuthController._();
  final AuthService _service = AuthService();
  bool isDiaologOpen = false;

  showNoInternetToast(String message, String subText,
      {route, String? buttonText}) {
    // set it `true` since dialog is being displayed
    log("isDiaologOpen:$isDiaologOpen");
    // isDiaologOpen
    //     ? null
    //     :
    showDiologue(message, subText, route: route, buttonText: buttonText);
  }

  Future<dynamic> userLogin(String username, String password, context) async {
    var body = {
      "username": username,
      "password": password,
    };
    return await _service.callUserLoginAPI(body, context);
  }

  Future<void> logoutUser() async {
    dynamic accessToken =
        await GlobelData().preferenceService.getUserAccessToken();
    // dynamic refreshToken = await preferenceService.getUserRefreshToken();
    bool isExpired = JwtDecoder.isExpired(accessToken);
    if (isExpired) {
      GlobelData().preferenceService.clear();
      Get.deleteAll();
      GlobelData().navigationRoutesHelper.navigateToLoginScreen();
    } else {
      GlobelData().dashboardController.logoutUser().then((value) {
        GlobelData().preferenceService.clear();
        Get.deleteAll();
        GlobelData().navigationRoutesHelper.navigateToLoginScreen();
      });
    }
  }

  showDiologue(String message, String subText, {route, String? buttonText}) {
    isDiaologOpen = true;
    Get.defaultDialog(
        title: message,
        middleText: subText,
        barrierDismissible: false,
        titleStyle: TextStyles.headingTextStyle3,
        middleTextStyle: TextStyles.textDark2TextStyle1,
        contentPadding: AppSizeHelper.spacingAllMedium,
        actions: <Widget>[
          CustomElevatedButton(
            title: buttonText ?? "TRY AGAIN",
            onPressed: route ??
                () {
                  Get.offAll(() => const SplashScreen());
                  isDiaologOpen = false;
                },
          )
        ],
        radius: 10);
  }
}
