import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';

import '../../../../generated/l10n.dart';

class CategoriesIwidget extends StatelessWidget {
  const CategoriesIwidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      S.of(context).SeeAll, //All recent
      S.of(context).Design,
      S.of(context).Programming,
      S.of(context).Management,
    ];
    // int currentIndex = 0;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).Categories,
                    style: FontManager.blacktext15.copyWith(
                        color: ColorsManager.KprimaryColor,
                        fontWeight: FontWeight.bold)),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).SeeAll,
                          style: FontManager.greytext12,
                        ),
                        Icon(
                          Intl.getCurrentLocale() == 'en'
                              ? EvaIcons.arrowIosForward
                              : EvaIcons.arrowIosBack,
                          size: 20,
                        ),
                      ],
                    )),
                // SizedBox(width: 10.w)
              ],
            ),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      cubit.changeCategoriesIndex(index);
                      cubit.getJobs();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.3.w),
                      child: Chip(
                        backgroundColor: cubit.categoryCurrentIndex == index
                            ? ColorsManager.KprimaryColor
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        label: ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth:
                                  Intl.getCurrentLocale() == 'en' ? 40.w : 20.w,
                              maxWidth: 90.w),
                          child: Text(
                            categories[index],
                            style: FontManager.purpletext10.copyWith(
                                fontWeight: FontWeight.w900,
                                color: cubit.categoryCurrentIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
