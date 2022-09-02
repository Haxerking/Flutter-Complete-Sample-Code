//this page may contain all controller in same class ie. login screen , forgetPassword screen, signUp screen, auth Screen
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:module_complete/screens/home/model/login_response_model.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../app_globel_data.dart';
import '../../../common/app_labels.dart';
import '../../../model/app_database_response_model.dart';
import '../model/auth_screen_response_model.dart';
import '../model/login_screen_response_model.dart';
import '../model/verify_otp_screen_response_model.dart';

class AuthScreenController extends GetxController {
  late Rx<TextEditingController> usernameTextController;
  late Rx<TextEditingController> passwordTextController;
  late Rx<TextEditingController> forgotPassTextController;
  late Rx<TextEditingController> phoneTextController;
  late Rx<TextEditingController> resendOtpTextController;
  late Rx<TextEditingController> otpTextController;
  late CustomAnimationControl control;
  final formKey = GlobalKey<FormState>();
  RxBool loadingStatus = false.obs;
  RxBool isLoginSuccess = false.obs;
  RxString value = "".obs;
  RxString resendvalue = "".obs;

  @override
  void onInit() {
    super.onInit();
    phoneTextController = TextEditingController().obs;
    otpTextController = TextEditingController().obs;
    usernameTextController = TextEditingController().obs;
    passwordTextController = TextEditingController().obs;
    forgotPassTextController = TextEditingController().obs;
    resendOtpTextController = TextEditingController().obs;
    control = CustomAnimationControl.stop;
  }

  userLogin(context) async {
    loadingStatus.value = true;
    isLoginSuccess.value = false;

    DataBaseResponseModel response = await GlobelData()
        .authController
        .userLogin(usernameTextController.value.text,
            passwordTextController.value.text, context);

    if (response.statusCode == 400) {
      changeLoadingStatus(false);
      loadingStatus.value = false;
      isLoginSuccess.value = false;
      control = CustomAnimationControl.stop;
      GlobelData().authController.showNoInternetToast(
          "Invalid Credentials", 'Please check your credentials and try again!',
          buttonText: AppLabels.close,
          route: () =>
              GlobelData().navigationRoutesHelper.navigateToPreviousScreen());
    } else {
      LoginScreenResponseModel loginResponseModel =
          LoginScreenResponseModel.fromJson(response.response);
      GlobelData().preferenceService.setLoginResponse(loginResponseModel);
      GlobelData()
          .preferenceService
          .setUserAccessToken(loginResponseModel.access);
      GlobelData()
          .preferenceService
          .setUserRefreshToken(loginResponseModel.refresh);
      Get.put(AuthScreenController()).resetValues();
      loadingStatus.value = false;
      isLoginSuccess.value = false;
      GlobelData().navigationRoutesHelper.navigateToDashboard(context);
    }
  }

  sendOtp(context, pageName) async {
    loadingStatus.value = true;
    DataBaseResponseModel response = await GlobelData()
        .dashboardController
        .sendOtp(phoneTextController.value.text);
    if (response.statusCode == 400) {
      changeLoadingStatus(false);
      loadingStatus.value = false;
      control = CustomAnimationControl.stop;
      GlobelData().authController.showNoInternetToast("Something went wrong!",
          'Please check your internet connection or try again!',
          buttonText: AppLabels.close,
          route: () =>
              GlobelData().navigationRoutesHelper.navigateToLoginScreen());
    } else {
      Get.put(AuthScreenController()).resetValues();
      loadingStatus.value = false;
      GlobelData().navigationRoutesHelper.navigateToAuthPage(
          context, pageName, phoneTextController.value.text);
    }
  }

  verifyOtp(context, pageName) async {
    loadingStatus.value = true;
    DataBaseResponseModel response = await GlobelData()
        .dashboardController
        .verifyOtp(
            phoneTextController.value.text, otpTextController.value.text);
    if (response.statusCode == 400) {
      changeLoadingStatus(false);
      loadingStatus.value = false;
      control = CustomAnimationControl.stop;
      GlobelData().authController.showNoInternetToast("Something went wrong!",
          'Please check your internet connection or try again!',
          buttonText: AppLabels.close,
          route: () =>
              GlobelData().navigationRoutesHelper.navigateToLoginScreen());
    } else {
      VerifyOtpScreenResponseModel visitorDetails =
          VerifyOtpScreenResponseModel.fromJson(response.response);
      GlobelData().preferenceService.setVisitorDetails(visitorDetails);
      Get.put(AuthScreenController()).resetValues();
      loadingStatus.value = false;
      GlobelData().navigationRoutesHelper.navigateToSelectionScreen(context);
    }
  }

  changeLoadingStatus(bool value) {
    loadingStatus.value = value;
  }

  changeButtonLoadingStatus(bool value) {
    control = value == true
        ? CustomAnimationControl.play
        : CustomAnimationControl.playReverse;
  }

  @override
  void onClose() {
    resetValues();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetValues() {
    control = CustomAnimationControl.stop;
    loadingStatus.value = false;

    isLoginSuccess.value = false;
    usernameTextController.value.text = "";
    passwordTextController.value.text = "";
    forgotPassTextController.value.text = "";
    isLoginSuccess.value = false;
  }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be blank';
    } else {
      return "";
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be blank';
    } else {
      return "";
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be blank';
    } else {
      return "";
    }
  }
}
