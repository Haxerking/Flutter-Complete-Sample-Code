// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:module_complete/common/app_size_helper.dart';

import '../app_colors.dart';
import '../theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback? onPressed;
  String title;
  bool? isExpanded;

  CustomElevatedButton(
      {Key? key, this.onPressed, required this.title, this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded == null ? double.infinity : null,
      height: 40,
      child: MaterialButton(
          color: AppColors.primaryColor1,
          disabledColor: AppColors.whiteShade5,
          disabledTextColor: AppColors.whiteColor,
          padding: AppSizeHelper.spacingTextFormField,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizeHelper.sizeDefault)),
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