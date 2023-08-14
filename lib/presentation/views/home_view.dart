import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:number_paginator/number_paginator.dart';
import 'widgets/home_widgets/caetgories_widget.dart';
import 'widgets/home_widgets/header_widgets.dart';
import 'widgets/home_widgets/listviewITEM.dart';
import 'widgets/home_widgets/searchBox_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AppCubit>(context).getUserData();
    tokenHolder = CacheHelper.getData(key: tokenKey);
    return BlocProvider(
      create: (context) => AppCubit()
        ..getUserData()
        ..getJobs(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderWidget(cubit: cubit),
                SizedBox(
                  height: 35.h,
                ),
                const SearchBoxWidget(),
                SizedBox(
                  height: 20.h,
                ),
                const CategoriesIwidget(),

                if (state is GetJobDataLoadingState) const Spacer(),
                state is GetJobDataFailureState
                    ? Expanded(
                        child: Center(
                            child: Text(
                          'Getting Data...',
                          style: FontManager.text25,
                        )),
                      )
                    : Flexible(
                        // flex: 50,
                        child: state is GetJobDataLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListViewItem(
                                      cubit: cubit, index: index);
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: cubit.jobs.length),
                      ),

                // SizedBox(height: 5.h,),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.h),
                    child: NumberPaginator(
                      numberPages: cubit.numberofPages,
                      // config: NumberPaginatorUIConfig(
                      //   // buttonSelectedBackgroundColor:
                      //       // ColorsManager.KprimaryColor,

                      // ),
                      initialPage: 0,
                      onPageChange: (index) {
                        cubit.changePage(index);
                        cubit.getJobs();
                        print(cubit.currentPage);
                      },
                    ))
              ],
            ),
          ));
        },
      ),
    );
  }
}
