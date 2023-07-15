// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/presentation/views/widgets/profile_widgets/divider.dart';
import 'package:job_app/presentation/views/widgets/profile_widgets/infoBlock_widget.dart';

import '../view_model/cubit/app_cubit.dart';
import 'widgets/profile_widgets/cover&profile_images_widget.dart';
import 'widgets/profile_widgets/skillsBlock_widget.dart';
import 'widgets/profile_widgets/userdetailswidget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit()..getUserData(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) async {
            AppCubit cubit = BlocProvider.of<AppCubit>(context);
            if (state is UpdateUserDataSuccessState) {
              await cubit.getUserData();
            }
          },
          builder: (context, state) {
            if (state is GetUserDataSuccessState) {
              AppCubit cubit = BlocProvider.of<AppCubit>(context);

              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cover_ProfileImagesWidget(cubit: cubit),
                      SizedBox(
                        height: 65.h,
                      ),
                      UserDetailsWidget(
                        name: cubit.userDataModel!.name!,
                        slug: cubit.userDataModel!.slug == null
                            ? '@yourslug'
                            : '@${cubit.userDataModel!.slug}',
                        joinedat: cubit.userDataModel!.joinedAt!,
                        cubit: cubit,
                        bio: cubit.userDataModel!.bio == null
                            ? '@yourBio'
                            : '${cubit.userDataModel!.bio}',
                        // isInUpdateMode: cubit.isInUpdateMode!,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 12.h,
                      ),
                      InfoBlockWidget(
                        cubit: cubit,
                        email: cubit.userDataModel!.email!,
                        joinedat: cubit.userDataModel!.joinedAt!,
                        phone: cubit.userDataModel?.phoneNumber ??
                            '+20 0113456879',
                        website:
                            cubit.userDataModel?.website ?? 'www.codeclub.com',
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 24.h,
                      ),
                      SkillsBlockWidget(
                        cubit: cubit,
                      )
                    ],
                  ),
                ),
              );
            } else if (state is GetUserDataFailureState) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
