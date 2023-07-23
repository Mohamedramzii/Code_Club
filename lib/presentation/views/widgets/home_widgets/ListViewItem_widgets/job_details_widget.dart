import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_managers/fonts.dart';
import '../../../../view_model/cubit/app_cubit.dart';

class JobDetailsWidget extends StatelessWidget {
  const JobDetailsWidget({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);
  final AppCubit cubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!Job Title
            Text(
              cubit.jobs[index].title!,
              style: FontManager.purpletext10,
            ),
            //!Job Budget
            Text(
              'Budget \$${cubit.jobs[index].budget.toString()} USD',
              style: FontManager.text10,
            ),
          ],
        ),
        //!Job Average Bid
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$78 USD',
              style: FontManager.text10,
            ),
            Text(
              'average bid',
              style: FontManager.text10.copyWith(fontSize: 5.sp),
            ),
          ],
        ),
      ],
    );
  }
}
