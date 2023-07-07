import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/common_widgets/customButtonWidget.dart';
import 'package:job_app/core/common_widgets/defaulttextformfield.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../view_model/cubit/app_cubit.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController forgotemailController = TextEditingController();

  final formKeybtmsheet = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
          listener: (BuildContext context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<AppCubit>(context);

            return Form(
              key: formKeybtmsheet,
              child: Column(
                children: [
                  const Text('Forgot Password'),
                  CustomTextFormFieldWidget(
                    textfieldHeadername: 'Enter Your Email',
                    hinttext: 'Email address',
                    controller: forgotemailController,
                    isPassword: false,
                    textInputType: TextInputType.emailAddress,
                    textinputaction: TextInputAction.done,
                    onsave: (value) {
                      forgotemailController.text = value!;
                    },
                    onvalidate: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  state is EmailRequestLoadingState
                      ? CircularProgressIndicator()
                      : CustomButton(
                          text: "Check",
                          color: ColorsManager.KTextFormFieldColor,
                          onpressed: () {
                            if (formKeybtmsheet.currentState!.validate()) {
                              formKeybtmsheet.currentState!.save();
                              cubit.emailRequest(
                                  email: forgotemailController.text.trim());
                            }
                          })
                ],
              ),
            );
          }),
    );
  }
}
