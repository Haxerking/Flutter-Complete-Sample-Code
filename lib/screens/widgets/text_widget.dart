import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFields extends StatelessWidget {
  final TextEditingController ctx;
  final String hintText;
  final String icons;
  final int maxLength;
  final TextInputType textInputType;
  final bool enabled;
  const TextFields(
      {Key? key,
      required this.ctx,
      required this.hintText,
      required this.icons,
      required this.maxLength,
      required this.textInputType,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15.0)),
      // border: Border.all(color: Colors.grey, width: 0.25)),
      margin: const EdgeInsets.only(left: 60, right: 60, top: 20),
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: hintText == "Purpose of meeting" ? 0.12.sh : 0.07.sh,
      child: Row(
        children: [
          Container(
            margin: hintText == "Purpose of meeting"
                ? const EdgeInsets.only(bottom: 30)
                : hintText == "Enter your alternate number"
                    ? const EdgeInsets.only(top: 10)
                    : const EdgeInsets.only(top: 0),
            child: SvgPicture.asset(
              icons,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: TextFormField(
              enabled: enabled,
              controller: ctx,
              keyboardType: textInputType,
              maxLines: 2,
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                    hintText == "Purpose of meeting" ? 100 : maxLength),
              ],
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
