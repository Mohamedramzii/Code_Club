import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_managers/ImagesManager.dart';
import '../../../../../core/app_managers/fonts.dart';
import '../../../../view_model/cubit/app_cubit.dart';

class JobOwnerInfoWidget extends StatelessWidget {
  const JobOwnerInfoWidget({
    Key? key,
    required this.cubit,
    required this.index,
    required this.days,
  }) : super(key: key);

  final AppCubit cubit;
  final int index;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // !User Image
        Container(
          width: 44.w,
          height: 45.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image.asset(ImagesManager.userimage),
        ),
        SizedBox(
          width: 5.w,
        ),
        //!User Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cubit.jobs[index].user!.username!,
              style: FontManager.purpletext10.copyWith(color: Colors.grey),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            Text(
              '@${cubit.jobs[index].user!.slug!}',
              style: FontManager.purpletext10.copyWith(color: Colors.grey),
            ),

            Text(
              days != 0 ? '${days.toString()} day(s) ago' : 'Today',
              style: FontManager.purpletext10.copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        )
      ],
    );
  }
}
