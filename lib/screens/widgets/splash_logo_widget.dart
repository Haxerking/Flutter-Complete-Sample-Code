import 'package:flutter/material.dart';
import '../../common/app_assets_helper.dart';
import '../auth/login_screen.dart';

class SplashLogoWidget extends StatefulWidget {
  const SplashLogoWidget({Key? key}) : super(key: key);

  @override
  State<SplashLogoWidget> createState() => _SplashLogoWidgetState();
}

class _SplashLogoWidgetState extends State<SplashLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        }
      });
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: const BoxDecoration(
          // color: AppColors.splashGradient,
          image: DecorationImage(
              image: AssetImage(AssetsHelper.icSplash), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
