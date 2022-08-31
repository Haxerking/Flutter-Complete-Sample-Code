//this screen created for any type of authorization like firebase authentication, OTP authentication, google login etc.....
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:module_complete/common/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../app_globel_data.dart';
import '../../common/app_assets_helper.dart';
import '../../common/custom/custom_back_button.dart';
import '../../common/custom/custom_elevated_button.dart';
import '../../common/theme/app_text_style.dart';
import 'controller/auth_screen_controller.dart';

class PhoneAuthScreen extends StatelessWidget {
  final String page;
  const PhoneAuthScreen({Key? key, required this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthScreenController());

    return Scaffold(
        // resizeToAvoidBottomInset: bottomType,
        backgroundColor: AppColors.bgLight0,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 35),
                    height: 0.92.sh,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 0.35.sh,
                          width: 1.sw,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SvgPicture.asset(
                              AssetsHelper.icPhoneBack,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Please enter your phone number",
                                style: TextStyles.headingTextStyle5),
                            SizedBox(
                              height: 0.1.sh,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(15.0)),
                              margin: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              height: 0.07.sh,
                              child: Row(
                                children: [
                                  Text(
                                    "+91",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19.sp,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 05,
                                  ),
                                  const SizedBox(width: 05),
                                  Container(
                                    width: 0.5,
                                    height: 0.035.sh,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: TextFormField(
                                      controller: authController
                                          .phoneTextController.value,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19.sp,
                                        color: Colors.black54,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Mobile number",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19.sp,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.09.sh,
                            ),
                            CustomElevatedButton(
                              title: 'Get OTP',
                              onPressed: () {
                                GlobelData()
                                    .navigationRoutesHelper
                                    .navigateToAuthPage(
                                        context,
                                        page,
                                        authController
                                            .phoneTextController.value.text);
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             OtpVerification(
                                //               selectedType:
                                //                   widget.selectedType,
                                //               phone:
                                //                   _phoneController.text,
                                //             )));
                              },
                            ),
                            SizedBox(
                              height: 0.04.sh,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.08.sh,
                    width: 1.sw,
                    child: Image.asset(
                      AssetsHelper.icCreativeMyndPng,
                    ),
                  ),
                ],
              ),
            ),
            CustomBackButton(
              onPressed: () {
                GlobelData().navigationRoutesHelper.goBack();
              },
            )
          ],
        ));
  }
}
