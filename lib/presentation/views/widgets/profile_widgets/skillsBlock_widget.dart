import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/colors.dart';

import 'package:job_app/core/app_managers/fonts.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../../../view_model/cubit/app_cubit.dart';

class SkillsBlockWidget extends StatefulWidget {
  SkillsBlockWidget({
    Key? key,
    // required this.skills,
    required this.cubit,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  // final List<String> skills;
  final AppCubit cubit;

  @override
  State<SkillsBlockWidget> createState() => _SkillsBlockWidgetState();
}

class _SkillsBlockWidgetState extends State<SkillsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // if (state is AddSkillsuccessState) {
        //   widget.cubit.getUserData();
        // }
      },
      builder: (context, state) {
        List skillList = [];
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarAnimation(
                  textEditingController: widget.controller,
                  isOriginalAnimation: true,
                  // enableKeyboardFocus: true,
                  durationInMilliSeconds: 500,

                  hintText: 'Add A Skill',
                  trailingWidget: InkWell(
                      onTap: () {
                        if (widget.controller.text.isNotEmpty) {
                          skillList.add(widget.controller.text);
                          print(skillList);
                          widget.cubit.updateUserData(
                              dataToChange: 'skills',
                              updateData: [
                                ...?widget.cubit.userDataModel!.skills,
                                ...skillList
                              ]);
                          widget.controller.clear();
                          widget.cubit.getUserData();
                        }
                      },
                      child: Text('Add',
                          style: FontManager.blacktext12
                              .copyWith(color: ColorsManager.KprimaryColor))),
                  secondaryButtonWidget: const Icon(EvaIcons.close),
                  buttonWidget: const Icon(EvaIcons.plus),
                  onFieldSubmitted: (value) {
                    if (widget.controller.text.isNotEmpty) {
                      skillList.add(widget.controller.text);
                      print(skillList);
                      widget.cubit.updateUserData(
                          dataToChange: 'skills',
                          updateData: [
                            ...?widget.cubit.userDataModel!.skills,
                            ...skillList
                          ]);
                      widget.controller.clear();
                      widget.cubit.getUserData();
                    }
                  },
                  onEditingComplete: () {},
                ),
                widget.cubit.userDataModel!.skills!.isEmpty
                    ? const Center(child: Text('No skills yet'))
                    : Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 5,
                        children: List.generate(
                          widget.cubit.userDataModel!.skills?.length ?? 0,
                          growable: true,
                          (index) => Chip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            label: Container(
                                alignment: Alignment.topLeft,
                                width: 80.w,
                                height: 25.h,
                                child: Center(
                                  child: Text(
                                    widget.cubit.userDataModel!.skills![index]
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                          ),
                        )),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ));
      },
    );
  }
}
