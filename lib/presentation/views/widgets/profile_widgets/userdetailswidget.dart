import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/fonts.dart';

import 'custom_container_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '@Fredrick',
          style: FontManager.greytext12,
        ),
        Text(
          'Muhammed Ramzy Gad',
          style: FontManager.blacktext15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bandung', style: FontManager.purpletext10),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 2.w,
              height: 10.h,
              color: Colors.black,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Joined March 2023', style: FontManager.purpletext10),
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomContainerWidget(
              icon: Icons.person,
              text: 'Follow',
            ),
            SizedBox(
              width: 6.w,
            ),
            const CustomContainerWidget(
              icon: EvaIcons.messageCircleOutline,
              text: 'Message',
            ),
            SizedBox(
              width: 6.w,
            ),
            const CustomContainerWidget(
              icon: EvaIcons.moreHorizontalOutline,
              text: 'More',
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            'CEO System D, Because your satiffaction is everything & Sttanding out from the rest, and that\'s what we want you to be as well.',
            style: FontManager.greytext12,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
