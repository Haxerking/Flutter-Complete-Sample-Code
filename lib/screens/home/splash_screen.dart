import 'package:flutter/material.dart';

import '../widgets/splash_logo_widget.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SplashLogoWidget()
    );
  }
}