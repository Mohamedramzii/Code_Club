import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_managers/colors.dart';
import '../../../../core/app_managers/fonts.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(EvaIcons.arrowIosBack,
                    color: ColorsManager.KprimaryColor),
              ),
              Text(
                'Job Info',
                style: FontManager.blacktext15,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.green.shade100),
            child: const Text('Open'),
          )
        ],
      ),
    );
  }
}
