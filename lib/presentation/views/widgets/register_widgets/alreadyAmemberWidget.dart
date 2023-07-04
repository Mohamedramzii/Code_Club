import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/app_managers/colors.dart';
import '../../../../core/app_managers/fonts.dart';
import '../../auth/login_view.dart';

class AlreadyAmemberWidget extends StatelessWidget {
  const AlreadyAmemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32.w),
      child: Row(
        children: [
          Text(
            'Already A Member? ',
            style: FontManager.greytext15,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(PageAnimationTransition(
                  page: LoginView(),
                  pageAnimationType: LeftToRightTransition()));
            },
            child: Text(
              'Log in',
              style: FontManager.greytext15
                  .copyWith(color: ColorsManager.KprimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
