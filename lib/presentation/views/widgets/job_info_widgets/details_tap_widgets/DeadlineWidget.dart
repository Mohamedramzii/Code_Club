import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_managers/fonts.dart';

class DeadlineWidget extends StatelessWidget {
  const DeadlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deadline',
          style: FontManager.blacktext15,
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
            width: 120.w,
            height: 25.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(width: 2, color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: 40.w,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    showCursor: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        isCollapsed: true),
                  ),
                ),
                Text(
                  'days',
                  style: FontManager.blacktext15,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ))
      ],
    );
  }
}
