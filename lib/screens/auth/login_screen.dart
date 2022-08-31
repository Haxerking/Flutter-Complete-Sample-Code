import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:module_complete/common/app_assets_helper.dart';
import 'package:module_complete/common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_globel_data.dart';
import '../../common/theme/app_text_style.dart';
import 'controller/auth_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(AuthScreenController());

    return Scaffold(
        backgroundColor: AppColors.bgLight0,
        body: SingleChildScrollView(
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
                        Text("Please Login with with your id and password",
                            style: TextStyles.headingTextStyle5),
                        SizedBox(
                          height: 0.06.sh,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 0.07.sh,
                          child: Row(
                            children: [
                              Icon(Icons.person,
                                  size: 0.03.sh, color: Colors.black54),
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
                                  controller: loginController
                                      .usernameTextController.value,
                                  keyboardType: TextInputType.name,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "User id",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                            right: 30,
                          ),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 0.07.sh,
                          child: Row(
                            children: [
                              Icon(Icons.lock,
                                  size: 0.03.sh, color: Colors.black54),
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
                                  obscureText: true,
                                  controller: loginController
                                      .passwordTextController.value,
                                  keyboardType: TextInputType.name,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        elevatedButton(
                            context: context,
                            name: 'Login',
                            onPressed: () {
                              // loginController.userLogin(context);
                              GlobelData()
                                  .navigationRoutesHelper
                                  .navigateToDashboard(context);
                            },
                            size: 20.sp),
                        SizedBox(
                          height: 0.04.sh,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.07.sh,
                child: Image.asset(
                  AssetsHelper.icCreativeMyndPng,
                ),
              ),
            ],
          ),
        ));
  }

  elevatedButton(
      {required VoidCallback? onPressed,
      required BuildContext? context,
      required String? name,
      required double? size}) {
    var screenHeight = MediaQuery.of(context!).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor: MaterialStateProperty.all(AppColors.buttonPink),
            minimumSize: MaterialStateProperty.all(
              Size(screenWidth * 0.35, screenHeight * 0.06),
            )),
        onPressed: onPressed,
        child: Text(
          name!,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ));
  }
}
