import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/assets.dart';
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
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Cover_ProfileImagesWidget(),
                  SizedBox(
                    height: 65.h,
                  ),
                  const UserDetailsWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomDivider(),
                  SizedBox(
                    height: 12.h,
                  ),
                  const InfoBlockWidget(),
                  SizedBox(
                    height: 21.h,
                  ),
                  const CustomDivider(),
                  SizedBox(
                    height: 24.h,
                  ),
                   SkillsBlockWidget()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
