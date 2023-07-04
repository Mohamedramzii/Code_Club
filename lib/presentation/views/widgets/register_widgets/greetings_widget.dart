import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_managers/assets.dart';
import '../../../../core/app_managers/fonts.dart';

class GreetingsWidgetRegister extends StatelessWidget {
  const GreetingsWidgetRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            ImagesManager.applogo,
            // height: 200.h,
            // width: 200.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32.w, top: 10.h),
          child: Text(
            'Start for free'.toUpperCase(),
            style: FontManager.greytext15,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32.w, bottom: 0),
          child: Text(
            'Create new account',
            style: FontManager.text25,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
