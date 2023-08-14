import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/ImagesManager.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';

import '../../../../generated/l10n.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 11.w,
          ),
          Icon(
            EvaIcons.searchOutline,
            color: ColorsManager.KprimaryColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          // Spacer(),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelStyle: FontManager.blacktext12,
                hintText: S.of(context).Explore,
                hintStyle: FontManager.greytext12,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18.h),
              ),
            ),
          ),

          Image.asset(ImagesManager.categories),
          SizedBox(
            width: 11.w,
          )
        ],
      ),
    );
  }
}
