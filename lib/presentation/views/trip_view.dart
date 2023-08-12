import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/common_widgets/customButtonWidget.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/widgets/project_viewWidgets/category_choices_widget.dart';
import 'package:job_app/presentation/views/widgets/project_viewWidgets/eachItemWidget.dart';

import '../../core/app_managers/strings.dart';
import '../../core/common_widgets/customToastWidget.dart';
import '../../generated/l10n.dart';

class TripView extends StatelessWidget {
  TripView({
    Key? key,
  }) : super(key: key);
  static TextEditingController controller1 = TextEditingController();
  static TextEditingController controller2 = TextEditingController();
  static TextEditingController controller3 = TextEditingController();
  static TextEditingController controller4 = TextEditingController();
  static TextEditingController controller5 = TextEditingController();

  List<String> skills = [];
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is PostJobDataSuccessState) {
          Toast.successToast(text: state.successMessage);
        }
      },
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
                    aboveFieldText: tr.addAProject,
                    belowFieldText: tr.short_title,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller2,
                    aboveFieldText: tr.Project_Related_Skills,
                    belowFieldText: tr.important_skills_required,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller3,
                    aboveFieldText: tr.Detaild_Description,
                    belowFieldText: tr.short_title,
                    isDescription: true,
                    maxlines: 8,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller4,
                    aboveFieldText: tr.Project_Budget,
                    belowFieldText:
                        tr.Choose_a_suitable_budget_to_get_good_deals,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EachItemWidget(
                    controller: controller5,
                    aboveFieldText: tr.Expected_Delivery_Time,
                    belowFieldText: tr.When_to_receive,
                    isDescription: false,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  JobcategoriesChoicesWidget(
                    cubit: cubit,
                    options: [
                      S.of(context).Design,
                      S.of(context).Programming,
                      S.of(context).Management
                    ],
                    onSelect: (selectedOption) {
                      print('Selected options: $selectedOption');
                      selectedCategory = selectedOption.isEmpty
                          ? 'programming'
                          : selectedOption[0].toLowerCase();
                      print('Selected category: $selectedCategory');
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // cubit.pickFile();
                      // cubit.pickFiles2();
                      cubit.openFilesss(context, cubit.openFile,
                          cubit.multipleFileResult?.files ?? []);
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
                  if (cubit.multipleFileResult != null)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: double.infinity,
                          maxWidth: double.infinity,
                          minHeight: 20.h,
                          maxHeight: 300.h),
                      // width: double.infinity,
                      // height: 100.h,
                      child: GridView.builder(
                        itemCount: cubit.multipleFileResult?.files.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          final file = cubit.multipleFileResult?.files[index];
                          return _buildFileItemWidget(file!, cubit);
                        },
                      ),
                    ),
                  SizedBox(
                    height: 25.h,
                  ),
                  state is PostJobDataLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.w),
                          child: CustomButton(
                              text: 'Post Now',
                              color: ColorsManager.KprimaryColor,
                              textcolor: Colors.white,
                              onpressed: () {
                                // List<String> skillsSplit =
                                //     controller2.text.split(',');
                                if (controller1.text.isNotEmpty &&
                                    controller2.text.isNotEmpty &&
                                    controller3.text.isNotEmpty &&
                                    controller4.text.isNotEmpty &&
                                    controller5.text.isNotEmpty) {
                                  cubit.postJobData(
                                      title: controller1.text,
                                      skills: controller2.text,
                                      description: controller3.text,
                                      budget: int.parse(controller4.text),
                                      time: controller5.text,
                                      category: selectedCategory);

                                  controller1.clear();
                                  controller2.clear();
                                  controller3.clear();
                                  controller4.clear();
                                  controller5.clear();
                                }
                              }),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFileItemWidget(PlatformFile? file, AppCubit cubit) {
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    final extention = file.extension ?? 'none';

    print(file.name);

    return InkWell(
      onTap: () => cubit.openFile(file),
      child: Container(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                  color: file.extension == 'PDF' || file.extension == 'pdf'
                      ? Colors.red.shade700
                      : file.extension == 'jpg'
                          ? Colors.blue
                          : Colors.grey,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Text(
                '.$extention',
                style: FontManager.blacktext15,
              ),
            ),
            Text(file.name),
            Text(fileSize)
          ],
        ),
      ),
    );
  }
}
