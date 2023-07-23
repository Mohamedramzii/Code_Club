import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/ImagesManager.dart';
import 'package:job_app/core/app_managers/fonts.dart';

import '../../../../core/app_managers/colors.dart';
import '../../../view_model/cubit/app_cubit.dart';

class ProposalsTap extends StatelessWidget {
  const ProposalsTap({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  static const List<String> images = [
    ImagesManager.profile,
    ImagesManager.profile1,
    ImagesManager.profile2,
    ImagesManager.profile3,
    ImagesManager.profile4,
  ];
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15.r),
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: Colors.grey.shade400)),
              child: Row(
                children: [
                  SizedBox(
                      child: Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      const Text('Mohamed K. @Moha.design'),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            ignoreGestures: true,
                            itemSize: 25.r,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: ColorsManager.KprimaryColor,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          Text(
                            '4',
                            style: FontManager.text10,
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image.asset(ImagesManager.comment),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '5',
                            style: FontManager.text10,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
