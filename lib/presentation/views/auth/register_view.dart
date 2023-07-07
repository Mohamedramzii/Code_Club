import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/ProfileView.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../core/app_managers/assets.dart';
import '../../../core/app_managers/colors.dart';
import '../../../core/app_managers/fonts.dart';
import '../../../core/app_managers/strings.dart';
import '../../../core/common_widgets/customButtonWidget.dart';
import '../../../core/common_widgets/defaulttextformfield.dart';
import '../widgets/register_widgets/alreadyAmemberWidget.dart';
import '../widgets/register_widgets/greetings_widget.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
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
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.of(context).push(PageAnimationTransition(
                page: const ProfileView(),
                pageAnimationType: BottomToTopTransition()));
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _key2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //logo
                  SizedBox(
                    height: 30.h,
                  ),
                  const GreetingsWidgetRegister(),
                  const AlreadyAmemberWidget(),

                  CustomTextFormFieldWidget(
                      textfieldHeadername: ENstrings.username,
                      hinttext: ENstrings.enterusername,
                      controller: usernameController,
                      isPassword: false,
                      onsave: (value) {
                        usernameController.text = value!;
                      },
                      onvalidate: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'enter a valid username';
                        }
                        return null;
                      },
                      textinputaction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(
                    height: 10.h,
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
                      textinputaction: TextInputAction.next,
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
                      textinputaction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword),

                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomButton(
                      text: ENstrings.signin,
                      color: ColorsManager.KprimaryColor,
                      bordercolor: ColorsManager.KprimaryColor,
                      textcolor: Colors.white,
                      onpressed: () {
                        if (_key2.currentState!.validate()) {
                          _key2.currentState!.save();
                          cubit.register(
                              email: emailController.text,
                              username: usernameController.text,
                              password: passwordController.text);
                        }
                      },
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
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
