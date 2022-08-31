//this screen created for any type of authorization like firebase authentication, OTP authentication, google login etc.....
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:module_complete/common/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../app_globel_data.dart';
import '../../common/app_assets_helper.dart';
import '../../common/custom/custom_back_button.dart';
import '../../common/custom/custom_elevated_button.dart';
import 'controller/auth_screen_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  final String page;
  final String phone;
  const AuthenticationScreen(
      {Key? key, required this.phone, required this.page})
      : super(key: key);

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
                              AssetsHelper.icOtpBack,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "Code is sent to ",
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),
                                    children: [
                                      TextSpan(
                                        text: "+91 $phone",
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      )
                                    ])),
                            SizedBox(
                              height: 0.08.sh,
                            ),
                            Center(
                              child: PinCodeTextField(
                                appContext: context,
                                autoDisposeControllers: false,
                                mainAxisAlignment: MainAxisAlignment.center,
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                textStyle:
                                    const TextStyle(color: Colors.black54),
                                hintCharacter: "X",
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  borderRadius: BorderRadius.circular(5),
                                  borderWidth: 2,
                                  fieldHeight: 0.07.sh,
                                  fieldWidth: 0.13.sw,
                                  activeFillColor:
                                      Colors.white.withOpacity(0.1),
                                  inactiveFillColor:
                                      AppColors.textPink.withOpacity(0.0),
                                  activeColor: AppColors.textPink,
                                  selectedColor: AppColors.bgLight0,
                                  selectedFillColor:
                                      Colors.white.withOpacity(0.99),
                                  inactiveColor:
                                      AppColors.textPink.withOpacity(0.8),
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                controller:
                                    authController.otpTextController.value,
                                onCompleted: (v) {
                                  log("Completed");
                                },
                                onChanged: (value) {
                                  authController.value.value;
                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 0.04.sh,
                            ),
                            SizedBox(
                              // width:  * 0.37,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Didn't recieve code?",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black26),
                                  ),
                                  Card(
                                    elevation: 0,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        // callOtp();
                                        GlobelData()
                                            .navigationRoutesHelper
                                            .navigateToresendAuthPage(
                                                context, "ResendPage", phone);
                                      },
                                      child: Text(
                                        "Request again",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.textPink
                                                .withOpacity(0.6)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.03.sh,
                            ),
                            CustomElevatedButton(
                              title: 'Submit',
                              onPressed: () {
                                GlobelData()
                                    .navigationRoutesHelper
                                    .navigateToVisitorBelongingsPage(
                                        context, page);
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
                GlobelData().navigationRoutesHelper.navigateToPreviousScreen();
              },
            ),
          ],
        ));
  }
}
