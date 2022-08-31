import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_size_helper.dart';
import '../theme/app_text_style.dart';

class CustomOutlinedButton extends StatelessWidget {
  VoidCallback? onPressed;
  String title;
  bool? isExpanded;

  CustomOutlinedButton(
      {Key? key, required this.onPressed, required this.title, this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded == null ? double.infinity : null,
      height: 40,
      child: MaterialButton(
          elevation: 0,
          color: AppColors.whiteColor,
          disabledColor: AppColors.whiteColor,
          disabledTextColor: AppColors.whiteColor,
          padding: AppSizeHelper.spacingTextFormField,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizeHelper.sizeDefault),
              side: BorderSide(
                  color: onPressed != null
                      ? AppColors.bgLight0
                      : AppColors.whiteShade5,
                  width: 2)),
          onPressed: onPressed,
          child: Text(
            title,
            style: onPressed != null
                ? TextStyles.secondaryButtonTextStyle2
                : TextStyles.secondaryDisabledButtonTextStyle,
            textAlign: TextAlign.center,
          )),
    );
  }
}