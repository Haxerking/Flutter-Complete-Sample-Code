// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_globel_data.dart';
import '../app_colors.dart';

class CustomBackButton extends StatelessWidget {
  VoidCallback? onPressed;

  CustomBackButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Card(
            elevation: 6,
            color: AppColors.buttonColorLight,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: SizedBox(
              height: 0.06.sh,
              width: 0.12.sw,
              child: Material(
                color: Colors.transparent,
                elevation: 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: onPressed,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
