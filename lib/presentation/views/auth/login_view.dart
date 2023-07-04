import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/assets.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/app_managers/strings.dart';
import 'package:job_app/core/common_widgets/defaulttextformfield.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/widgets/login_widgets/greetings_widget.dart';

import '../../../core/common_widgets/customButtonWidget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation:0,
        // backgroundColor:Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsManager.KprimaryColor,
            statusBarIconBrightness: Brightness.light),
        actions: [
          Image.asset(ImagesManager.person),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                SizedBox(
                  height: 30.h,
                ),
                const GreetingsWidget(),
                SizedBox(
                  height: 70.h,
                ),
                CustomTextFormFieldWidget(
                    textfieldHeadername: ENstrings.email,
                    hinttext: ENstrings.enteremail,
                    controller: emailController,
                    isPassword: false,
                    onsave: (value) {
                      emailController.text = value!;
                    },
                    onvalidate: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'enter a valid email address';
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormFieldWidget(
                    textfieldHeadername: ENstrings.password,
                    hinttext: ENstrings.enterpassword,
                    controller: passwordController,
                    isPassword: true,
                    onsave: (value) {
                      passwordController.text = value!;
                    },
                    onvalidate: (value) {
                      if (value!.isEmpty && value.length < 8) {
                        return 'password must be at least 8 characters ';
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword),
                    
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: cubit.isCheckBoxChanged,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              cubit.checkBox(value!);
                              if (value) {
                                print('true');
                              }
                            },
                          ),
                          Text(
                            'Remember for 30 days',
                            style: FontManager.blacktext12,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(ENstrings.forgotpassword,
                            style: FontManager.blacktext12
                                .copyWith(color: ColorsManager.KprimaryColor)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: CustomButton(
                    text: ENstrings.signin,
                    color: ColorsManager.KprimaryColor,
                    bordercolor: ColorsManager.KprimaryColor,
                    textcolor: Colors.white,
                    onpressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: CustomButton(
                    text: 'Sign in with Google',
                    color: Colors.white,
                    onpressed: () {},
                    textcolor: Colors.black,
                    widget: Image.asset(ImagesManager.googleicon),
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: FontManager.greytext12,
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'SignUp',
                        style: FontManager.greytext12
                            .copyWith(color: ColorsManager.KprimaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
