import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:module_complete/app_globel_data.dart';
import 'package:module_complete/screens/home/visitor/controller/visitor_screen_controller.dart';
import '../../../common/app_assets_helper.dart';
import '../../../common/app_colors.dart';
import '../../../common/custom/custom_back_button.dart';
import '../../../common/custom/custom_elevated_button.dart';
import '../../../common/theme/app_text_style.dart';

class Belongings extends StatelessWidget {
  final String selectedType;

  const Belongings({Key? key, required this.selectedType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final visitorController = Get.put(VisitorScreenController());
    return Scaffold(
        backgroundColor: AppColors.bgLight0,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // padding: const EdgeInsets.only(bottom: 35),
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
                              AssetsHelper.icTypeSelection,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 110),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("What kinds of stuff you have carry?",
                                    style: TextStyles.headerStyledark),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Center(
                                  child: Container(
                                    width: 0.7.sw,
                                    margin: const EdgeInsets.only(top: 30),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Container(
                                                    width: 0.25.sw,
                                                    height: 0.16.sh,
                                                    margin: EdgeInsets.only(
                                                        top: 0.02.sh,
                                                        left: 0.04.sw,
                                                        right: 0.04.sw),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors.grey
                                                                  .shade300,
                                                              Colors
                                                                  .grey.shade200
                                                            ])),
                                                    child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          onTap: () {
                                                            visitorController
                                                                .changeStatusA(
                                                                    false);
                                                            //     .a.value ==
                                                            // !visitorController
                                                            //     .a.value;
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text("Laptop",
                                                                    style: TextStyle(
                                                                        fontSize: 19
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .black87)),
                                                                SizedBox(
                                                                    height:
                                                                        0.075
                                                                            .sh,
                                                                    width:
                                                                        0.12.sw,
                                                                    child: Image
                                                                        .asset(
                                                                      AssetsHelper
                                                                          .icLaptop,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ))),
                                                visitorController.a.value
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                right: 20),
                                                        child: SizedBox(
                                                            height: 35,
                                                            child: Image.asset(
                                                                AssetsHelper
                                                                    .icCheck)))
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Container(
                                                    width: 0.25.sw,
                                                    height: 0.16.sh,
                                                    margin: EdgeInsets.only(
                                                        top: 0.02.sh,
                                                        left: 0.04.sw,
                                                        right: 0.04.sw),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors.grey
                                                                  .shade300,
                                                              Colors
                                                                  .grey.shade200
                                                            ])),
                                                    child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          onTap: () {
                                                            visitorController
                                                                .changeStatusC(
                                                                    false);
                                                            // visitorController
                                                            //         .b.value =
                                                            //     !visitorController
                                                            //         .b.value;
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text("Tab",
                                                                    style: TextStyle(
                                                                        fontSize: 19
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .black87)),
                                                                SizedBox(
                                                                    height:
                                                                        0.075
                                                                            .sh,
                                                                    width:
                                                                        0.12.sw,
                                                                    child: Image
                                                                        .asset(
                                                                      AssetsHelper
                                                                          .icTab,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ))),
                                                visitorController.b.value
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                right: 20),
                                                        child: SizedBox(
                                                            height: 35,
                                                            child: Image.asset(
                                                                AssetsHelper
                                                                    .icCheck)))
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Container(
                                                    width: 0.25.sw,
                                                    height: 0.16.sh,
                                                    margin: EdgeInsets.only(
                                                        top: 0.02.sh,
                                                        left: 0.04.sw,
                                                        right: 0.04.sw),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors.grey
                                                                  .shade300,
                                                              Colors
                                                                  .grey.shade200
                                                            ])),
                                                    child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          onTap: () {
                                                            visitorController
                                                                .changeStatusC(
                                                                    false);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text("Mobile",
                                                                    style: TextStyle(
                                                                        fontSize: 19
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .black87)),
                                                                SizedBox(
                                                                    height:
                                                                        0.075
                                                                            .sh,
                                                                    width:
                                                                        0.12.sw,
                                                                    child: Image
                                                                        .asset(
                                                                      AssetsHelper
                                                                          .icPhoneV,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ))),
                                                visitorController.c.value
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                right: 20),
                                                        child: SizedBox(
                                                            height: 35,
                                                            child: Image.asset(
                                                                AssetsHelper
                                                                    .icCheck)))
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Container(
                                                    width: 0.25.sw,
                                                    height: 0.16.sh,
                                                    margin: EdgeInsets.only(
                                                        top: 0.02.sh,
                                                        left: 0.04.sw,
                                                        right: 0.04.sw),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors.grey
                                                                  .shade300,
                                                              Colors
                                                                  .grey.shade200
                                                            ])),
                                                    child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          onTap: () {
                                                            visitorController
                                                                .changeStatusD(
                                                                    false);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text("Bag",
                                                                    style: TextStyle(
                                                                        fontSize: 19
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .black87)),
                                                                SizedBox(
                                                                    height:
                                                                        0.075
                                                                            .sh,
                                                                    width:
                                                                        0.12.sw,
                                                                    child: Image
                                                                        .asset(
                                                                      AssetsHelper
                                                                          .icBag,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ))),
                                                visitorController.d.value
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                right: 20),
                                                        child: SizedBox(
                                                            height: 35,
                                                            child: Image.asset(
                                                                AssetsHelper
                                                                    .icCheck)))
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                visitorController.others.value == false
                                    ? Container(
                                        width: 0.25.sw,
                                        height: 0.16.sh,
                                        margin: EdgeInsets.only(
                                            top: 0.02.sh,
                                            left: 0.04.sw,
                                            right: 0.04.sw),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            gradient: LinearGradient(colors: [
                                              Colors.grey.shade300,
                                              Colors.grey.shade200
                                            ])),
                                        child: Material(
                                            color: Colors.transparent,
                                            elevation: 0,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                visitorController
                                                    .changeStatusO(false);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text("Others",
                                                        style: TextStyle(
                                                            fontSize: 19.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors
                                                                .black87)),
                                                    SizedBox(
                                                      height: 0.075.sh,
                                                      width: 0.12.sw,
                                                      child: Image.asset(
                                                        AssetsHelper.icOthers,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )))
                                    : Container(
                                        height: 0.13.sh,
                                        width: 0.52.sw,
                                        decoration: BoxDecoration(
                                            color: Colors.black12
                                                .withOpacity(0.05),
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        // border: Border.all(color: Colors.grey, width: 0.25)),
                                        margin: const EdgeInsets.only(top: 40),

                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: TextFormField(
                                          controller: visitorController
                                              .otherController.value,
                                          keyboardType: TextInputType.name,
                                          // inputFormatters: [
                                          // LengthLimitingTextInputFormatter(20),
                                          // ],
                                          textAlign: TextAlign.start,
                                          textInputAction: TextInputAction.next,
                                          maxLines: 10,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.sp,
                                            color: Colors.black54,
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: "Enter other stuff",
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.sp,
                                                color: Colors.black54,
                                              )),
                                        ),
                                      ),
                                const SizedBox(height: 40),
                                CustomElevatedButton(
                                  title: 'Next',
                                  onPressed: () {
                                    GlobelData()
                                        .navigationRoutesHelper
                                        .navigateToVisitorDetails(
                                            selectedType, context);
                                  },
                                ),
                              ]),
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
