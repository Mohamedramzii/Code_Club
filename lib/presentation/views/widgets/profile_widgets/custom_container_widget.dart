import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/fonts.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      width: 85.w,
      height: 25.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.grey)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          Text(
            text,
            style: FontManager.blacktext12,
          )
        ],
      ),
    );
  }
}
