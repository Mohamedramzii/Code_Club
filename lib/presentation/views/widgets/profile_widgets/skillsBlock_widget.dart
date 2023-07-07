import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/fonts.dart';

class SkillsBlockWidget extends StatelessWidget {
  SkillsBlockWidget({super.key});
  List<String> skills = [
    'UI Designer',
    'UX Designer',
    'Design',
    'System',
    'Product',
    'Succesfull',
    'Design System'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Wrap(
            spacing: 5,
            children: List.generate(
              skills.length,
              growable: true,
              (index) => Chip(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                label: SizedBox(
                    width: 80.w,
                    height: 25.h,
                    child: Center(
                      child: Text(
                        skills[index],
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    )),
                labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
              ),
            )));
  }
}

class containerWidget extends StatelessWidget {
  const containerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 90.w,
      // height: 25.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Text(
        'UI Designer',
        style: FontManager.greytext12,
        textAlign: TextAlign.center,
      ),
    );
  }
}
