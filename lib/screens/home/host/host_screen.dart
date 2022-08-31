import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app_globel_data.dart';
import '../../../common/custom/custom_back_button.dart';
import '../../../common/theme/app_text_style.dart';
import 'controller/host_screen_controller.dart';

class HostList extends StatelessWidget {
  final String selectedType;
  HostList({Key? key, required this.selectedType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hostController = Get.put(HostScreenController());
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 0.2.sh,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100)),
                    gradient: LinearGradient(
                        colors: [Color(0xff5E71B6), Color(0xffA8B8F0)])),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text("Search for a host!",
                      style: TextStyles.headerStylelight),
                ),
              ),
              CustomBackButton(
                onPressed: () {
                  GlobelData().navigationRoutesHelper.goBack();
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.16.sh,
                  ),
                  height: 0.065.sh,
                  width: 0.54.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: SizedBox(
                    height: 0.065.sh,
                    width: 0.54.sw,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 6,
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            TextFormField(
                              controller: hostController.searchController.value,
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black54,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: GlobelData()
                                        .hostselectedduration
                                        .value
                                        .isEmpty
                                    ? "Search"
                                    : GlobelData().hostselectedduration.value,
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Positioned(
                              // right: 65,
                              left: 0.25.sw,
                              child: Container(
                                // padding: const EdgeInsets.only(top: 20),
                                alignment: Alignment.centerLeft,
                                // width: screenWidth * 0.21,
                                child: DropdownButton<String>(
                                  isExpanded: false,
                                  isDense: true,
                                  dropdownColor: Colors.black.withOpacity(0.6),
                                  underline: const SizedBox(),
                                  hint: Text(
                                    GlobelData().hostselectedduration.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  items: GlobelData()
                                      .searchType
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    hostController.dropDown(newValue);
                                    log(newValue.toString());
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      color: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: (() {
                          GlobelData()
                              .navigationRoutesHelper
                              .navigateToHostDetailsPage(context, selectedType);
                        }),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                              bottom: 10.0, top: 10.0, left: 20, right: 20),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pratyush Pandey",
                                  style: TextStyles.headingTextStyle),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 12.0, top: 10),
                                child: Image.asset(
                                  "assets/icLogo.png",
                                  width: 80,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: GlobelData().richText(
                                          context: context,
                                          title: GlobelData().hosttitle[i],
                                          subtitle:
                                              GlobelData().hostsubTitle[i]),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
