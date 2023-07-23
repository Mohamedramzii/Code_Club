import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/common_widgets/customButtonWidget.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';

import '../../../../core/app_managers/colors.dart';
import 'details_tap_widgets/BidAmountWidget.dart';
import 'details_tap_widgets/DeadlineWidget.dart';

class DetailsTapWidget extends StatelessWidget {
  const DetailsTapWidget({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);
  final AppCubit cubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Details',
                  style: FontManager.blacktext15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cubit.jobs[index].budget.toString()} USD',
                      textAlign: TextAlign.start,
                      style: FontManager.blacktext15,
                    ),
                    Text(
                      'BIDDING ENDS IN 8 DAYS',
                      style: FontManager.text10,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  cubit.jobs[index].title!,
                  style: FontManager.blacktext12,
                ),
                SizedBox(height: 25.h),
                Text(
                  'Skills Required',
                  style: FontManager.blacktext12,
                ),
                cubit.jobs[index].skills.toString() == 'null'
                    ? Text(
                        'No Skills Required for this job',
                        style: FontManager.blacktext12,
                      )
                    : Wrap(
                        children: List.generate(
                          cubit.jobs[index].skills!.split(',').length,
                          (indexx) {
                            List<String> item =
                                cubit.jobs[index].skills!.split(',');
                            return Text(
                              item.last == item[indexx].toString()
                                  ? item[indexx].toString()
                                  : '${item[indexx].toString()} • ',
                              style: FontManager.greytext15
                                  .copyWith(color: ColorsManager.KprimaryColor),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Project ID : 36904778'),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(EvaIcons.copy, color: Colors.grey),
                        label: Text(
                          'Report Project',
                          style: FontManager.blacktext12,
                        ))
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Place a Bid on this Project',
                style: FontManager.blacktext12,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'You will be able to edit your bid until the project is awarded to someone.',
                style: FontManager.text10,
              ),
              SizedBox(
                height: 15.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BidAmountWidget(),
                  DeadlineWidget(),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Describe your proposal (minimum 100 characters)',
                style: FontManager.blacktext12,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                minLines: 5,
                maxLines: 50,
                maxLength: 100,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ))),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 80.w),
                child: CustomButton(
                    text: 'Place Bid',
                    textcolor: Colors.white,
                    color: ColorsManager.KprimaryColor,
                    onpressed: () {}),
              )
            ]),
          )
        ],
      ),
    );
  }
}
