import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_globel_data.dart';
import '../../common/app_assets_helper.dart';
import '../../common/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.bgLight1,
          child: const Icon(Icons.logout),
          onPressed: () {
            GlobelData().navigationRoutesHelper.navigateToLoginScreen();
          }),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    AppColors.transparent.withOpacity(0.7), BlendMode.modulate),
                image: const AssetImage(AssetsHelper.icSplash),
                fit: BoxFit.fill)),
        child: Column(children: [
          const SizedBox(height: 10),
          SafeArea(
            child: Container(
              alignment: Alignment.centerRight,
              child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                color: AppColors.bgLight1.withOpacity(1.0),
                elevation: 6,
                child: InkWell(
                  onTap: (() {
                    GlobelData()
                        .navigationRoutesHelper
                        .navigateToPhoneAuthPage(context, "Logout");
                  }),
                  child: Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.30,
                    padding: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "Check Out",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.20,
            child: Image.asset(
              AssetsHelper.icLogo,
              scale: 0.8,
            ),
          ),
          Center(
            child: Text(
              "Let us know you're here",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.bgLight1),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.buttonColorDark),
                minimumSize: MaterialStateProperty.all(
                  Size(screenWidth * 0.30, screenHeight * 0.06),
                )),
            onPressed: () {
              GlobelData()
                  .navigationRoutesHelper
                  .navigateToSelectionScreen(context);
              // Navigator.of(context)
              //     .push(RouteAnimation(page: const TypeSelection()));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  AssetsHelper.icArrowRight,
                  fit: BoxFit.cover,
                  height: screenHeight * 0.035,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: screenHeight * 0.08,
                      autoPlay: true,
                      viewportFraction: 0.3),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(RouteAnimation(page: const AboutUs()));
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.white.withOpacity(0.5),
                        elevation: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: screenHeight * 0.06,
                          child: Image.asset(
                            i == 0
                                ? AssetsHelper.icFooter1
                                : i == 1
                                    ? AssetsHelper.icFooter2
                                    : i == 2
                                        ? AssetsHelper.icFooter3
                                        : AssetsHelper.icFooter2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: screenHeight * 0.06,
            child: Image.asset(
              AssetsHelper.icCreativeMynd,
              scale: 1.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
