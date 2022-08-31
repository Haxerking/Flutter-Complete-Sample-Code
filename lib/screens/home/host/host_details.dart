// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../app_globel_data.dart';
import '../../../common/app_assets_helper.dart';
import '../../../common/custom/custom_back_button.dart';
import '../../../common/custom/custom_elevated_button.dart';
import '../../../common/theme/app_text_style.dart';
import '../../widgets/text_widget.dart';
import 'controller/host_screen_controller.dart';

class HostDetailsScreen extends StatelessWidget {
  final String selectedType;

  const HostDetailsScreen({Key? key, required this.selectedType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hostController = Get.put(HostScreenController());

    final List<TextEditingController> hostlistData = [
      hostController.nameController.value,
      hostController.emailController.value,
      hostController.durationController.value,
      hostController.phoneController.value,
      hostController.meetingStartTimeController.value,
      hostController.orgTypeController.value
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
                                    child: Text("Tell us bit about your host!",
                                        style: TextStyles.headerStylelight),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 0.175.sh,
                                    width: 0.23.sw,
                                    child: CircleAvatar(
                                      radius: 0.07.sh,
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Wrap(
                                          children: [
                                            Image.asset(
                                              "assets/profile.jpg",
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  for (int i = 0; i < 6; i++)
                                    i == 3
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // _selectStartTime();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black12
                                                            .withOpacity(0.05),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 60,
                                                            right: 10,
                                                            top: 20),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    height: 0.07.sh,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AssetsHelper.icTime,
                                                          fit: BoxFit.fill,
                                                          alignment: Alignment
                                                              .topCenter,
                                                        ),
                                                        const SizedBox(
                                                            width: 15),
                                                        Expanded(
                                                          child: TextFormField(
                                                            enabled: false,
                                                            controller:
                                                                hostController
                                                                    .meetingStartTimeController
                                                                    .value,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16.sp,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Start Time",
                                                              hintStyle:
                                                                  TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12
                                                          .withOpacity(0.05),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  margin: const EdgeInsets.only(
                                                      left: 10,
                                                      right: 60,
                                                      top: 20),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  height: 0.07.sh,
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AssetsHelper.icTime,
                                                        fit: BoxFit.fill,
                                                        alignment:
                                                            Alignment.topCenter,
                                                      ),
                                                      const SizedBox(width: 15),
                                                      Expanded(
                                                        child: DropdownButton<
                                                            String>(
                                                          isExpanded: true,
                                                          dropdownColor: Colors
                                                              .black
                                                              .withOpacity(0.6),
                                                          underline:
                                                              const SizedBox(),
                                                          hint: Text(
                                                            GlobelData()
                                                                .hostselectedduration
                                                                .value,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16.sp,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                          items: GlobelData()
                                                              .HostMeetingDuration
                                                              .map((String
                                                                  value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: Colors
                                                                      .white70,
                                                                ),
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged:
                                                              (newValue) {
                                                            // setState(() {
                                                            //   selectedduration =
                                                            //       newValue!;
                                                            //   _durationController
                                                            //           .text =
                                                            //       selectedduration;
                                                            //   log(newValue
                                                            //       .toString());
                                                            // });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        : i == 4
                                            ? const SizedBox()
                                            : TextFields(
                                                ctx: hostlistData[i],
                                                hintText:
                                                    GlobelData().visitorText[i],
                                                icons: GlobelData()
                                                    .visitorImage[i],
                                                maxLength: 30,
                                                textInputType:
                                                    GlobelData().type[i],
                                                enabled:
                                                    GlobelData().enabled[i]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomElevatedButton(
                                    title: 'Next',
                                    onPressed: () {
                                      GlobelData()
                  .navigationRoutesHelper
                  .navigateToGratitudeScreenPage(context);
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
          ),
        ],
      ),
    );
  }

  // Future<void> _selectStartTime() async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialEntryMode: TimePickerEntryMode.input,
  //     useRootNavigator: false,
  //     confirmText: "Set",
  //     cancelText: "Cancel",
  //     routeSettings: const RouteSettings(),
  //     initialTime: selectedStartTime,
  //     builder: (BuildContext context, Widget? child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(
  //           alwaysUse24HourFormat: false,
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       selectedStartTime = picked;
  //       _meetingStartTimeController.text = selectedStartTime
  //           .toString()
  //           .replaceAll("TimeOfDay(", "")
  //           .replaceAll(")", "");
  //       timeStart = GlobelData().formatTimeOfDay(selectedStartTime, 'HH:mm');
  //       log("$selectedStartTime");
  //     });
  //   }
  // }
}
