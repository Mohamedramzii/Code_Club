import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';

import 'widgets/home_widgets/caetgories_widget.dart';
import 'widgets/home_widgets/header_widgets.dart';
import 'widgets/home_widgets/listviewITEM.dart';
import 'widgets/home_widgets/searchBox_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    tokenHolder = CacheHelper.getData(key: tokenKey);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
      child: Column(
        children: [
          const HeaderWidget(),
          SizedBox(
            height: 35.h,
          ),
          const SearchBoxWidget(),
          SizedBox(
            height: 20.h,
          ),
          const CategoriesIwidget(),
          Flexible(
            // flex: 50,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ListViewItem();
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5),
          ),

          // SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child:
                Text('< 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 >'),
          )
        ],
      ),
    ));
  }
}
