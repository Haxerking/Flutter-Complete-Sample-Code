import 'package:flutter/material.dart';

import '../app_colors.dart';

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 15,
        width: 15,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.whiteColor),
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}
