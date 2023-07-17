import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';

import '../../../../core/app_managers/colors.dart';
import '../../../../core/app_managers/fonts.dart';

class JobcategoriesChoicesWidget extends StatelessWidget {
  JobcategoriesChoicesWidget({
    Key? key,
    required this.options,
    required this.onSelect,
    required this.cubit,
  }) : super(key: key);
  final List<String> options;
  final Function(List<String>) onSelect;
  final AppCubit cubit;

  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job category',
          style: FontManager.blacktext12,
        ),
        GestureDetector(
          onTap: () {
            cubit.ClickedToChooseCategory();
          },
          child: Container(
            width: double.infinity,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: ColorsManager.ksometextsColor,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              child: Text(
                'Choose a category',
                textAlign: TextAlign.left,
              ),
            ),

            // child: DropdownButtonFormField(
            //   hint: Text('Select options'),
            //   items: options.map((option) {
            //     return DropdownMenuItem(
            //       value: option,
            //       child: Row(
            //         children: [
            //           Checkbox(
            //             value: cubit.selectedOptions.contains(option),
            //             onChanged: (value) {
            //               cubit.selectedOptionsChoices(value!, option);
            //               onSelect(cubit.selectedOptions);
            //             },
            //           ),
            //           Text(option),
            //         ],
            //       ),
            //     );
            //   }).toList(),
            //   onChanged: (_) {},
            // )
          ),
        ),
        Text(
          'Choose a category which fits your job vacancy',
          style: FontManager.text10,
        ),
        SizedBox(
          height: 10.h,
        ),
        if (cubit.isClickedToChooseCategory!)
          AnimatedContainer(
            width: double.infinity,
            height: 170.h,
            curve: Curves.easeIn,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorsManager.ksometextsColor)),
            duration: const Duration(milliseconds: 10000),
            child: Column(
              children: options.map((option) {
                return CheckboxListTile(
                    title: Text(option),
                    value: cubit.selectedOptions.contains(option),
                    onChanged: (value) {
                      cubit.selectedOptionsChoices(value!, option);
                      onSelect(cubit.selectedOptions);
                    });
              }).toList(),
            ),
          ),
      ],
    );
  }
}
