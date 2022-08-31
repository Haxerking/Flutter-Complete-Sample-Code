//this page may contain all controller in same class ie. login screen , forgetPassword screen, signUp screen, auth Screen
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:module_complete/screens/home/model/login_response_model.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../app_globel_data.dart';
import '../../../common/app_labels.dart';
import '../../../model/app_database_response_model.dart';

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
  RxString value = "".obs;  RxString resendvalue = "".obs;

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
      // LoginErrorResponseModel loginResponseModel =
      // LoginErrorResponseModel.fromJson(response.response);

      loadingStatus.value = false;
      isLoginSuccess.value = false;
      control = CustomAnimationControl.stop;
      GlobelData().authController.showNoInternetToast(
          "Invalid Credentials", 'Please check your credentials and try again!',
          buttonText: AppLabels.close,
          route: () =>
              GlobelData().navigationRoutesHelper.navigateToPreviousScreen());
    } else {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.response);
      GlobelData().preferenceService.setLoginResponse(loginResponseModel);
      GlobelData()
          .preferenceService
          .setUserAccessToken(loginResponseModel.access);
      GlobelData()
          .preferenceService
          .setUserRefreshToken(loginResponseModel.refresh);

      // Get.put(HomePageController()).changePage(0);
      // Get.put(HomePageController()).changeMenuPage(0);

      Get.put(AuthScreenController()).resetValues();
      // Get.put(HomePageController()).getUserRoleWithLocation().then((value) {
      //   loadingStatus.value = false;
      //   isLoginSuccess.value = false;
      //  GlobelData().navigationRoutesHelper.navigateToDashboard(context);
      // });
      GlobelData().navigationRoutesHelper.navigateToDashboard(context);
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
    // TODO: implement onClose

    resetValues();
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose

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
