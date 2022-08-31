import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_globel_data.dart';
import '../../common/app_assets_helper.dart';
import '../../common/app_colors.dart';

class GratitudeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AssetsHelper.icGraditude,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 0.06.sh,
                  backgroundColor: AppColors.bgLight1,
                  child: CircleAvatar(
                    radius: 0.04.sh,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.check,
                      size: 0.08.sh,
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Please wait while host approve your \nrequest/invite!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AssetsHelper.icThanks,
                      fit: BoxFit.cover,
                    ),
                    MaterialButton(
                      onPressed: () {
                        GlobelData()
                            .navigationRoutesHelper
                            .navigateToDashboard(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: SvgPicture.asset(
                          AssetsHelper.icHome,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.09,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
