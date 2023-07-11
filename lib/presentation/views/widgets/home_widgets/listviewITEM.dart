import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/ImagesManager.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    double rate = 3.5;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 44.w,
              height: 45.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.asset(ImagesManager.userimage),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Freelancer Onboarding',
                  style: FontManager.purpletext10.copyWith(color: Colors.grey),
                ),
                // SizedBox(
                //   height: 5.h,
                // ),
                Text(
                  '@markmaster',
                  style: FontManager.purpletext10.copyWith(color: Colors.grey),
                ),

                Text(
                  '17 days ago',
                  style: FontManager.purpletext10.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design fabric',
                  style: FontManager.purpletext10,
                ),
                Text(
                  'Budget \$30 – 250 USD',
                  style: FontManager.text10,
                ),
              ],
            ),
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
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'I am looking sir someone to help design a Chinoiserie / toile fabric design. Like the top left. Thank you',
          style: FontManager.text10,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
            'Graphic Design . Photoshop . Fashion Design . Photoshop . Design . T-Shirts',
            style: FontManager.purpletext10),
        SizedBox(
          height: 17.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '43 minutes ago',
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
    );
  }
}
