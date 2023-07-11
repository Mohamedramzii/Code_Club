import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';

import '../../../../core/app_managers/ImagesManager.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => CacheHelper.clearData(key: tokenKey),
              child: CircleAvatar(    
                radius: 20.r,
                backgroundImage: const AssetImage(ImagesManager.profile),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello there',
                  style: FontManager.greytext12,
                ),
                Text(
                  'Muahmmed Ramzy',
                  style: FontManager.blacktext12
                      .copyWith(color: ColorsManager.KprimaryColor),
                ),
              ],
            )
          ],
        ),
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade200, shape: BoxShape.circle),
          child: Icon(
            Icons.mail_rounded,
            color: ColorsManager.KprimaryColor,
          ),
        )
      ],
    );
  }
}
