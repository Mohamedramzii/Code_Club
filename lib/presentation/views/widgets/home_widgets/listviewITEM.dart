import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/ImagesManager.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/job_info_view.dart';
import 'package:job_app/presentation/views/widgets/home_widgets/ListViewItem_widgets/listview_jobOwner_info.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'ListViewItem_widgets/job_details_widget.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);
  final AppCubit cubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    double rate = 3.5;

    //-------------- Date Conversion --------------------------------------
    String date = cubit.jobs[index].createdAt.toString();

    List<String> dateParts = date.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    DateTime startDate = DateTime(year, month, day);
    DateTime endDate = DateTime.now();

    Duration finalDate = endDate.difference(startDate);
    int days = finalDate.inDays;
    // int hours = finalDate.inHours % 24;
    // int minutes = finalDate.inMinutes % 60;
    // int seconds = finalDate.inSeconds % 60;
//------------------ End Of Date Conversion -------------------------------
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageAnimationTransition(
                page: JobInfoView(cubit:cubit, index: index,),
                pageAnimationType: RightToLeftTransition()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobOwnerInfoWidget(cubit: cubit, index: index, days: days),
          SizedBox(
            height: 10.h,
          ),
          // !Job details
          JobDetailsWidget(cubit: cubit, index: index),
          SizedBox(
            height: 5.h,
          ),
          //!Job Description
          Text(
            cubit.jobs[index].description ?? '',
            style: FontManager.text10,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 25.h,
          ),

          //!Job skills
          Text('Required Skills:',
              style: FontManager.text10
                  .copyWith(color: ColorsManager.KprimaryColor)),
          cubit.jobs[index].skills.toString() == 'null'
              ? Text(
                  'No Skills Required for this job',
                  style: FontManager.blacktext12,
                )
              : Wrap(
                  children: List.generate(
                    cubit.jobs[index].skills!.split(',').length,
                    (indexx) {
                      List<String> item = cubit.jobs[index].skills!.split(',');
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
            height: 17.h,
          ),

          //!Job Time
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$days days ago',
                style: FontManager.text10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.bookmark,
                  color: Colors.grey,
                ),
                padding: EdgeInsets.zero,
              )
            ],
          ),
          //! Job rate
          Row(
            children: [
              RatingBar.builder(
                initialRating: rate,
                ignoreGestures: true,
                itemSize: 25.r,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: ColorsManager.KprimaryColor,
                ),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              ),
              Text(
                '$rate',
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
      ),
    );
  }
}
