import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/common_widgets/customButtonWidget.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/widgets/project_viewWidgets/eachItemWidget.dart';
import '../../core/app_managers/strings.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});
  static TextEditingController controller1 = TextEditingController();
  static TextEditingController controller2 = TextEditingController();
  static TextEditingController controller3 = TextEditingController();
  static TextEditingController controller4 = TextEditingController();
  static TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  EachItemWidget(
                    controller: controller1,
                    aboveFieldText: ENstrings.addAProject,
                    belowFieldText: ENstrings.underaddAProject,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller2,
                    aboveFieldText: ENstrings.projectRelatedSkills,
                    belowFieldText: ENstrings.belowprojectRelatedSkills,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller3,
                    aboveFieldText: ENstrings.detailedDescr,
                    belowFieldText: ENstrings.belowdetailedDescr,
                    isDescription: true,
                    maxlines: 8,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller4,
                    aboveFieldText: ENstrings.projectBudget,
                    belowFieldText: ENstrings.belowprojectBudget,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller5,
                    aboveFieldText: ENstrings.deliverytime,
                    belowFieldText: ENstrings.belowdeliverytime,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.pickFile();
                    },
                    child: Container(
                      width: 110.w,
                      height: 32.h,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Colors.grey)),
                      child: const Row(
                        children: [Text('Attach File'), Icon(EvaIcons.attach)],
                      ),
                    ),
                  ),
                  if (cubit.pickedFilePlatform != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (cubit.pickedFilePlatform != null)
                        SizedBox(
                          height: 80.h,
                          width: 200.w,
                          child: Image.file(cubit.fileToDisplay!),
                        ),
                        // if (cubit.pageImage != null)
                        //   SizedBox(
                        //     height: 80.h,
                        //     width: 200.w,
                        //     child: Image.memory(
                        //         cubit.pageImage! ),
                        //   ),
                        Text(cubit.filename!)
                      ],
                    ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80.w),
                    child: CustomButton(
                        text: 'Post Now',
                        color: ColorsManager.KprimaryColor,
                        textcolor: Colors.white,
                        onpressed: () {}),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
