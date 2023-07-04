import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.bordercolor,
    required this.color,
    this.textcolor,
    required this.onpressed,
    this.widget,
  }) : super(key: key);
  final String text;
  final Color? bordercolor;
  final Color? color;
  final Color? textcolor;
  final Function() onpressed;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // padding: EdgeInsets.symmetric(horizontal: 32.w),
      minWidth: 312.w,
      height: 33.h,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: bordercolor ?? ColorsManager.KTextFormFieldColor)),
      onPressed: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget ?? const SizedBox(),
          Text(
            text,
            style: FontManager.blacktext15.copyWith(color: textcolor),
          ),
        ],
      ),
    );
  }
}
