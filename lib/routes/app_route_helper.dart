import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class RouteHelper {
  RouteHelper._();

  factory RouteHelper.getInstance() => _instance;
  static final RouteHelper _instance = RouteHelper._();

  void navigateToSplashScreen() {
    Get.offAllNamed(initial);
  }

  navigateToVisitorDetails(String selectedType, context) {
    Navigator.pushNamedAndRemoveUntil(
        context, visitorDetails, arguments: selectedType, (route) => true);
  }

  void navigateToDashboard(context) {
    Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
  }

  void navigateToAuthPage(context, pageName, phone) {
    Navigator.pushNamedAndRemoveUntil(
        context, auth, arguments: [pageName, phone], (route) => true);
  }

  void navigateToresendAuthPage(context, pageName, phone) {
    Navigator.pushNamedAndRemoveUntil(
        context, resendOtp, arguments: [pageName, phone], (route) => false);
  }

  void navigateToPhoneAuthPage(context, pageName) {
    Navigator.pushNamedAndRemoveUntil(
        context, phoneAuth, arguments: pageName, (route) => true);
  }

  void navigateToVisitorBelongingsPage(context, selectedType) {
    Navigator.pushNamedAndRemoveUntil(
        context, visitorbelongings, arguments: selectedType, (route) => false);
  }

  void navigateToHostListPage(context, selectedType) {
    Navigator.pushNamedAndRemoveUntil(
        context, hostlist, arguments: selectedType, (route) => true);
  }

  void navigateToHostDetailsPage(context, selectedType) {
    Navigator.pushNamedAndRemoveUntil(
        context, hostdetails, arguments: selectedType, (route) => true);
  }

  void navigateToGratitudeScreenPage(context) {
    Navigator.pushNamedAndRemoveUntil(context, gratitude, (route) => false);
  }

  void navigateToLoginScreen() {
    Get.offAllNamed(login);
  }

  navigateToPreviousScreen() {
    Get.back();
  }

  navigateToSelectionScreen(context) {
    Navigator.pushNamed(context, visitTypeSelection);
  }

  goBack() {
    Get.back();
  }

  navigateToForgotPasswordScreen(context) {
    Navigator.pushNamed(context, forgotPassword);
  }
}
