import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_size_helper.dart';

abstract class TextStyles {
  static TextStyle get primaryDisabledButtonTextStyle => TextStyle(
        color: AppColors.whiteColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get alertDialogMessageStyle => TextStyle(
        color: AppColors.textDark2,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get secondaryButtonTextStyle2 => TextStyle(
        color: AppColors.bgLight0,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get secondaryDisabledButtonTextStyle => TextStyle(
        color: AppColors.whiteShade5,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get textDark2TextStyle1 => TextStyle(
      color: AppColors.textDark2,
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w500,
      );

  static TextStyle get headingTextStyle1 => TextStyle(
      color: AppColors.textDark1,
      fontSize: FontSize.s20,
      fontWeight: FontWeight.w700,
      );

  static TextStyle get headingTextStyle4 => TextStyle(
      color: AppColors.whiteColor,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get headingTextStyle5 => TextStyle(
        color: Colors.black45,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get headerStyledark => TextStyle(
        color: Colors.black54,
        fontSize: FontSize.s19,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headerStylelight => TextStyle(
        color: Colors.white,
        fontSize: FontSize.s19,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headingTextStyle2 => TextStyle(
      color: AppColors.textDark1,
      fontSize: FontSize.s26,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get headingTextStyle3 => TextStyle(
      color: AppColors.textDark1,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get headingTextStyle => TextStyle(
      color: const Color.fromRGBO(0, 0, 0, 0.541),
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get captionTextStyle => TextStyle(
        color: AppColors.whiteColor,
        fontSize: FontSize.s13,
      );
  static TextStyle get captionTextStyle2 => TextStyle(
        color: Colors.black45,
        fontSize: FontSize.s13,
      );

  static TextStyle get captionBOldTextStyle => TextStyle(
      color: AppColors.subTextColor,
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w700);

  static TextStyle get linkTextStyleSemiSmall => TextStyle(
      color: AppColors.linkTextColor,
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.9);

  static TextStyle get linkTextStyleSmall => TextStyle(
        color: AppColors.linkTextColor,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get linkTextStyleSmall1 => TextStyle(
        color: AppColors.textDark1,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get whiteTextStyleSmall1 => TextStyle(
        color: AppColors.whiteColor,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyStyle2 => TextStyle(
        color: AppColors.linkTextColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get lightTextStyle2 => TextStyle(
        color: AppColors.textLight2,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get hintTextStyle1 => TextStyle(
        color: AppColors.subTextColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get primaryButtonTextStyle => TextStyle(
        color: AppColors.whiteColor,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get secondaryButtonTextStyle => TextStyle(
        color: AppColors.linkTextColor,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get optionMenuTextStyle => TextStyle(
        color: AppColors.textDark3,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get tableRowTextStyle => TextStyle(
        color: AppColors.textDark1,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get tableHeadingTextStyle => TextStyle(
        color: AppColors.textDark1,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get navBarTextStyle => TextStyle(
        color: AppColors.primaryButtonColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get fabMenuTextStyle => TextStyle(
        color: AppColors.textDark1,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get selectedTabTextStyle => TextStyle(
        color: AppColors.selectedTabColor,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get unSelectedTabTextStyle => TextStyle(
        color: AppColors.textDark1,
        fontSize: FontSize.s17,
        fontWeight: FontWeight.w500,
      );

  //FOR custom style work

  static creativeTextStyle(
      Color color, double fontsize, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
    );
  }
}
