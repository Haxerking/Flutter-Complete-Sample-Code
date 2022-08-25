import 'package:flutter/material.dart';
import 'app_routes.dart';


class RouteHelper {
  RouteHelper._();

  factory RouteHelper.getInstance() => _instance;
  static final RouteHelper _instance = RouteHelper._();

  void navigateToSplashScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context,initial,
        (route) => false);
  }

  void navigateToDashboard(context) {
    Navigator.pushNamedAndRemoveUntil(
        context,home,
            (route) => false);
  }

  void navigateToLoginScreen(context) {
    Navigator.pushNamedAndRemoveUntil(
        context,login,
            (route) => false);

  }

  navigateToPreviousScreen(context){
    Navigator.pop(context);
  }

  navigateToForgotPasswordScreen(context) {
    Navigator.pushNamed(
        context,forgotPassword);
  }
    navigateToSignUpScreen(context) {
    Navigator.pushNamed(
        context,signup);
  }
}