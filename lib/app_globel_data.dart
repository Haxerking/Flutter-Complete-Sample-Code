import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:module_complete/common/theme/app_text_style.dart';
import 'package:module_complete/screens/home/visitor/controller/visitor_screen_controller.dart';

import 'app_time_helper.dart';
import 'common/app_assets_helper.dart';
import 'common/app_colors.dart';
import 'common/app_size_helper.dart';
import 'common/custom/custom_elevated_button.dart';
import 'common/custom/custom_outline_button.dart';
import 'controller/auth_controller.dart';
import 'controller/home_controller.dart';
import 'database/ap_rx_helper.dart';
import 'database/app_loacal_database_helper.dart';
import 'routes/app_route_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class GlobelData {
  final preferenceService = PreferenceService.getInstance();
  final navigationRoutesHelper = RouteHelper.getInstance();
  final rxDataStore = RxDataStore.getInstance();
  final authController = AuthController.getInstance();
  final dashboardController = HomeController.getInstance();
  final Rx<String> pageName = "".obs;
    dynamic selectedLogo;

  void showToastMessage(String message, isValidated) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.textDark2,
        textColor: AppColors.whiteColor,
        webShowClose: true,
        webBgColor: isValidated
            ? "linear-gradient(to right, #00b09b, #96c93d)"
            : "linear-gradient(to right, #d61398,#d61313 )",
        webPosition: "center");
  }

  showAlertBox(
      {required BuildContext context,
      required String message,
      required buttonRoute,
      cancelRoute,
      buttonText,
      cancelText,
      required String title}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyles.headingTextStyle3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizeHelper.sizeMedium)),
            actionsPadding: AppSizeHelper.spacingAllDefault,
            elevation: 5,
            content: Padding(
              padding: AppSizeHelper.spacingAllZero,
              child: Text(message, style: TextStyles.alertDialogMessageStyle),
            ),
            actionsAlignment: MainAxisAlignment.end,
            actions: <Widget>[
              CustomOutlinedButton(
                onPressed: cancelRoute ??
                    () => GlobelData()
                        .navigationRoutesHelper
                        .navigateToPreviousScreen(),
                title: cancelText,
                isExpanded: true,
              ),
              CustomElevatedButton(
                onPressed: buttonRoute,
                title: buttonText,
              )
            ],
          );
        });
  }

  showCustomAlertBoxWidget(
      {required BuildContext context,
      required buttonRoute,
      cancelRoute,
      required content,
      buttonText,
      cancelText,
      required String title}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyles.headingTextStyle3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizeHelper.sizeMedium)),
            actionsPadding: AppSizeHelper.spacingAllDefault,
            elevation: 5,
            scrollable: true,
            content: Text(content, style: TextStyles.textDark2TextStyle1),
            actionsAlignment: MainAxisAlignment.end,
            actions: <Widget>[
              CustomOutlinedButton(
                onPressed: cancelRoute ??
                    () => GlobelData()
                        .navigationRoutesHelper
                        .navigateToPreviousScreen(),
                title: cancelText,
                isExpanded: true,
              ),
              CustomElevatedButton(
                onPressed: buttonRoute,
                title: buttonText,
              )
            ],
          );
        });
  }

// showConfirmDiaologRoute({context, message, id, docRemark, label,}) {
//   var textData = "";
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return GetX<ExpenseVoucherController>(builder: (data) {
//           return StatefulBuilder(builder: (context, setStates) {
//             return AlertDialog(
//               contentPadding: const EdgeInsets.all(30),
//               actionsPadding: const EdgeInsets.all(10),
//               content: Material(
//                 color: AppColors.whiteColor,
//                 elevation: 0,
//                 child: SizedBox(
//                   width: 400,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(message, style: TextStyles.headingTextStyle3),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         onChanged: (text) {
//                           textData = text;
//                         },
//                         minLines: 4,
//                         // any number you need (It works as the rows for the textarea)
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         decoration: InputDecoration(
//                           hintText: 'Any Remarks',
//                           filled: true,
//                           fillColor: Colors.grey.shade100,
//                           labelText: 'Any Remarks',
//                           labelStyle: TextStyles.hintTextStyle1,
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               actions: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       flex: 4,
//                       child: CustomOutlinedButton(
//                           onPressed: () {
//                             navigationRoutes.navigateToPreviousScreen();
//                           },
//                           title: AppLabels.cancel),
//                     ),
//                     AppSizeHelper.spacingBoxMediumWidth,
//                     Expanded(
//                       flex: 6,
//                       child: CustomElevatedButton(
//                           onPressed: () {
//                             data.markActionOnVoucher(id, docRemark, textData);
//                           },
//                           title: label),
//                     )
//                   ],
//                 ),
//               ],
//             );
//           });
//         });
//       });
// }
  final List<Color> color1 = [
    AppColors.cardColor1,
    AppColors.cardColor3,
    AppColors.cardColor5,
    AppColors.cardColor7
  ];
  final List<Color> color2 = [
    AppColors.cardColor2,
    AppColors.cardColor4,
    AppColors.cardColor6,
    AppColors.cardColor8
  ];
  final List<String> text = ["Business", "Personal", "Vendor", "Delivery"];
  final List<String> subtitle = [
    "Business: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "Persoanl: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "Vendor: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "Delivery: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
  ];
  final List<String> image = [
    AssetsHelper.icBusiness,
    AssetsHelper.icPersonal,
    AssetsHelper.icContract,
    AssetsHelper.icDelivery
  ];

  final List<String> searchFilter = ["Weekly", "Monthly", "Yearly"];
  List<String> visitorText = [
    "Enter your full name",
    "Enter your email",
    "Enter your phone number",
    "Enter your alternate number",
    "Enter your current Address",
    "Enter your Organization name"
  ];
  final List<String> HostTtitle = [
    "Designation: ",
    "Business Unit: ",
    "Function: ",
    "Company E-mail: "
  ];
  final List<String> HostSubTitle = [
    "Software Engineer.",
    "Product.",
    "IT Software",
    "pratyush.pandey@myndsol.com"
  ];
  final List<String> hostMeetingDuration = [
    'From name',
    'From email',
    'From number',
  ];
  final List type = [
    TextInputType.name,
    TextInputType.emailAddress,
    TextInputType.phone,
    TextInputType.phone,
    TextInputType.streetAddress,
    TextInputType.multiline,
  ];
  final List<String> HostMeetingDuration = [
    '30 Min',
    '1 Hrs',
    '1:30 Hrs',
    '2 Hrs',
    "Full Day"
  ];
  String selectedduration = "30 Min";
  final List enabled = [true, true, false, true, true, true];
  final List<String> visitorImage = [
    AssetsHelper.icUser,
    AssetsHelper.icEmail,
    AssetsHelper.icCall,
    AssetsHelper.icPhone,
    AssetsHelper.icAddress,
    AssetsHelper.icOrg
  ];

    List<String> hosttext = [
      "Host Name",
      "Host Email",
      "Host Number",
      "Start Time",
      "Duration",
      "Purpose of meeting"
    ];
    List hosttype = [
      TextInputType.name,
      TextInputType.emailAddress,
      TextInputType.phone,
      TextInputType.phone,
      TextInputType.streetAddress,
      TextInputType.multiline,
    ];
    List hostenabled = [true, true, false, true, true, true];
    List<String> hostimage = [AssetsHelper.icUser, AssetsHelper.icEmail, AssetsHelper.icCall, AssetsHelper.icTime, AssetsHelper.icTime, AssetsHelper.icOrg];
  Decoration getContainerDecoration() {
    return const BoxDecoration(
      color: AppColors.whiteColor,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: AppColors.whiteShade3,
        ),
      ),
    );
  }

  String diffBtDatesFromNow({
    required String dateTime,
  }) {
    log("Diff from now : $dateTime");
    DateTime dt = ConDateTime().convertDateFromString(dateTime);
    DateTime currentdate = DateTime.now();
    Duration returnDT = currentdate.difference(dt);
    return returnDT.inDays.toString();
  }

  String diffBtDates({
    required String dateTime,
    required String dateTime2,
  }) {
    log("Deff by Date : $dateTime");
    log("Deff by Date 2 : $dateTime2");
    DateTime dt = ConDateTime().convertDateFromString(dateTime);
    DateTime dt2 = ConDateTime().convertDateFromString(dateTime2);
    Duration returnDT = dt.difference(dt2);
    return returnDT.inDays.toString();
  }

  String getInitials({required String string}) {
    var buffer = StringBuffer();
    var split = string.replaceAll("  ", " ").split(' ');

    try {
      if (split.length == 1) {
        buffer.write(split[0][0]);
      } else {
        for (var i = 0; i < 2; i++) {
          buffer.write(split[i][0]);
        }
      }
      return buffer.toString();
    } catch (_) {
      buffer.write(split[0][0]);
      return buffer.toString();
    }
  }

  richText({String? title, String? subtitle, BuildContext? context}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: RichText(
          softWrap: false,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.start,
          maxLines: 2,
          text: TextSpan(
              text: title,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black54),
              children: [
                TextSpan(
                  text: subtitle,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54),
                )
              ])),
    );
  }
  final  selectedStartTime = TimeOfDay.now();
  final  selectedEndTime = TimeOfDay.now();
  void popUpButton(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(11, 4, 58, 0.7)),
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 200.0, bottom: 200.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> hosttitle = [
    "Designation: ",
    "Business Unit: ",
    "Function: ",
    "Company E-mail: "
  ];
  List<String> hostsubTitle = [
    "Software Engineer.",
    "Product.",
    "IT Software",
    "pratyush.pandey@myndsol.com"
  ];
  List<String> searchType = [
    'From name',
    'From email',
    'From number',
  ];
  RxString hostselectedduration = "".obs;
  InputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizeHelper.borderDefault),
      borderSide: const BorderSide(
        color: AppColors.whiteShade4,
      ),
    );
  }
  String formatTimeOfDay(TimeOfDay tod, String stFormat) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat(stFormat); //"6:00 AM"
  return format.format(dt);
}
}
