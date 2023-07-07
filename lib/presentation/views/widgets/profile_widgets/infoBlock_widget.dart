import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';

class InfoBlockWidget extends StatelessWidget {
  const InfoBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Information',
            style: FontManager.blacktext15
                .copyWith(color: ColorsManager.KprimaryColor),
          ),
          SizedBox(
            height: 17.h,
          ),
          _buildRow(EvaIcons.globe, 'Website', 'www.CodeClub.com'),
          SizedBox(
            height: 18.h,
          ),
          _buildRow(
              EvaIcons.emailOutline, 'Email', 'mohamedramzii219@gmail.com'),
          SizedBox(
            height: 18.h,
          ),
          _buildRow(EvaIcons.phoneOutline, 'Phone', '+20 0123 456 789'),
          SizedBox(
            height: 18.h,
          ),
          _buildRow(EvaIcons.calendarOutline, 'Joined', '26 March, 2023'),
        ],
      ),
    );
  }

  Row _buildRow(IconData icon, String text, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //icon
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(
              width: 15.w,
            )
            //text
            ,
            Text(
              text,
              style: FontManager.greytext12,
            )
          ],
        ),
        Text(
          info,
          style: FontManager.blacktext12,
        )
      ],
    );
  }
}
