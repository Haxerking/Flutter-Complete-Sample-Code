import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_complete/app_globel_data.dart';
import 'package:module_complete/screens/auth/auth_screen.dart';
import 'package:module_complete/screens/auth/phone_auth_screen.dart';
import 'package:module_complete/screens/home/host/host_details.dart';
import 'package:module_complete/screens/home/host/host_screen.dart';
import '../default_screen.dart';
import '../landing_screen.dart';
import '../screens/auth/controller/auth_screen_controller.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/resend_auth_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/home/gratitude.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/visit_type_selection_screen.dart';
import '../screens/home/visitor/visitor_belongings.dart';
import '../screens/home/visitor/visitor_details.dart';
import 'app_routes.dart';

class NavigationRoutes {
  static Route<NavigationRoutes> generateRoute(RouteSettings settings) {
    final controller = Get.put(AuthScreenController());
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
          settings: settings,
        );
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case auth:
        return MaterialPageRoute(
            builder: (_) => AuthenticationScreen(
                page: GlobelData().pageName.value,
                phone: controller.phoneTextController.value.text));
      case phoneAuth:
        return MaterialPageRoute(
            builder: (_) => PhoneAuthScreen(
                  page: GlobelData().pageName.value,
                ));
      case visitTypeSelection:
        return MaterialPageRoute(builder: (_) => const VisitTypeSelection());
      case resendOtp:
        return MaterialPageRoute(
            builder: (_) => ResendAuthScreen(
                page: GlobelData().pageName.value,
                phone: controller.phoneTextController.value.text));
      case visitorbelongings:
        return MaterialPageRoute(
            builder: (_) => const Belongings(selectedType: ""));
      case visitorDetails:
        return MaterialPageRoute(
          builder: (_) => VisitorDetails(
            selectedType: '',
          ),
          settings: settings,
        );
      case hostlist:
        return MaterialPageRoute(
          builder: (_) => HostList(
            selectedType: '',
          ),
          settings: settings,
        );
      case hostdetails:
        return MaterialPageRoute(
          builder: (_) => const HostDetailsScreen(
            selectedType: '',
          ),
          settings: settings,
        );
        case gratitude:
        return MaterialPageRoute(
          builder: (_) =>  GratitudeScreen(
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const DefaultScreen());
    }
  }
}
