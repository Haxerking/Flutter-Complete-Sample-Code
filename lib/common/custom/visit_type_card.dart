import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_globel_data.dart';
import '../theme/app_text_style.dart';

class Cards extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color v1;
  final Color v2;
  const Cards(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.v1,
      required this.v2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0.02.sh, left: 0.04.sw, right: 0.04.sw),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [v1, v2])),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            GlobelData()
                .navigationRoutesHelper
                .navigateToPhoneAuthPage(context, title);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.headingTextStyle4),
                    const SizedBox(
                      height: 05,
                    ),
                    Text(subtitle, style: TextStyles.captionTextStyle)
                  ],
                )),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 0.07.sw,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
