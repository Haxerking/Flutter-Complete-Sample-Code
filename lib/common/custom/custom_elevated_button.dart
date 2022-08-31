// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module_complete/common/app_size_helper.dart';

import '../app_colors.dart';
import '../theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback? onPressed;
  String title;

  CustomElevatedButton(
      {Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.06.sh,
      width: 0.3.sh,
      child: MaterialButton(
          color: AppColors.buttonPink,
          disabledColor: AppColors.whiteShade5,
          disabledTextColor: AppColors.whiteColor,
          padding: AppSizeHelper.spacingTextFormField,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizeHelper.sizeMedium)),
          onPressed: onPressed,
          child: Text(
            title,
            style: onPressed != null
                ? TextStyles.primaryButtonTextStyle
                : TextStyles.primaryDisabledButtonTextStyle,
            textAlign: TextAlign.center,
          )),
    );
  }
}
