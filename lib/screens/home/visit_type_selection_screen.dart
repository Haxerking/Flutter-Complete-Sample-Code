// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_complete/app_globel_data.dart';
import 'package:module_complete/common/custom/visit_type_card.dart';

import '../../common/app_assets_helper.dart';
import '../../common/app_colors.dart';
import '../../common/theme/app_text_style.dart';

class VisitTypeSelection extends StatelessWidget {
  const VisitTypeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgLight0,
        body: Column(
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
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("What brings you here today?",
                              style: TextStyles.headerStyledark),
                          SizedBox(
                            height: 0.04.sh,
                          ),
                          for (int i = 0; i < 4; i++)
                            Cards(
                                title: GlobelData().text[i],
                                subtitle: GlobelData().subtitle[i],
                                image: GlobelData().image[i],
                                v1: GlobelData().color1[i],
                                v2: GlobelData().color2[i])
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
        ));
  }
}
