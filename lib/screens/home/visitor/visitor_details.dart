// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_globel_data.dart';
import '../../../common/app_assets_helper.dart';
import '../../../common/app_colors.dart';
import '../../../common/custom/custom_back_button.dart';
import '../../../common/custom/custom_elevated_button.dart';
import '../../../common/theme/app_text_style.dart';
import '../../widgets/text_widget.dart';
import 'controller/visitor_screen_controller.dart';

class VisitorDetails extends StatelessWidget {
  final String selectedType;
  VisitorDetails({Key? key, required this.selectedType}) : super(key: key);

  String currentText = "";

  @override
  Widget build(BuildContext context) {
    final visitorController = Get.put(VisitorScreenController());
    final List<TextEditingController> listData = [
      visitorController.nameController.value,
      visitorController.emailController.value,
      visitorController.phoneController.value,
      visitorController.alternatePhoneController.value,
      visitorController.addressController.value,
      visitorController.orgTypeController.value
    ];
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.99.sh,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 0.4.sh,
                        width: 1.sw,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            AssetsHelper.icVisitorBack,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Flexible(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Text("Tell us bit about yourself!",
                                        style: TextStyles.headerStylelight),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CircleAvatar(
                                        radius: 0.07.sh,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          clipBehavior: Clip.hardEdge,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Wrap(
                                            children: [
                                              // selectedLogo == null
                                              //     ? Image.asset(
                                              //         "assets/profile.jpg",
                                              //       )
                                              //     : Image.file(
                                              //         File("$selectedLogo"),
                                              //       ),
                                              Image.asset(
                                                "assets/profile.jpg",
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // _changeProfile();
                                        },
                                        child: Material(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: CircleAvatar(
                                            radius: 14.sp,
                                            backgroundColor: AppColors.textPink,
                                            child: SvgPicture.asset(
                                                width: 16.sp,
                                                AssetsHelper.icEdit),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  for (int i = 0; i < 6; i++)
                                    TextFields(
                                        ctx: listData[i],
                                        hintText: GlobelData().visitorText[i],
                                        icons: GlobelData().visitorImage[i],
                                        maxLength: 30,
                                        textInputType: GlobelData().type[i],
                                        enabled: GlobelData().enabled[i]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomElevatedButton(
                                    title: 'Next',
                                    onPressed: () {
                                      GlobelData()
                                          .navigationRoutesHelper
                                          .navigateToHostListPage(
                                              context, selectedType);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
      ),
    );
  }
}
