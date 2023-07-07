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
import 'package:job_app/presentation/views/auth/register_view.dart';
import 'package:job_app/presentation/views/widgets/login_widgets/greetings_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../core/common_widgets/customButtonWidget.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController forgotemailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKeybtmsheet1 = GlobalKey<FormState>();
  final formKeybtmsheet2 = GlobalKey<FormState>();
  final formKeyresetphase = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   // backgroundColor:Colors.white,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: ColorsManager.KprimaryColor,
      //       statusBarIconBrightness: Brightness.light),
      //   actions: [
      //     InkWell(
      //         onTap: () {
      //           CacheHelper.clearData(key: tokenKey);
      //         },
      //         child: Image.asset(ImagesManager.person)),
      //     SizedBox(
      //       width: 10.w,
      //     )
      //   ],
      // ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          if (state is LoginSuccessState) {
            MotionToast.success(description: Text(cubit.loginModel!.message!))
                .show(context);
          }
          if (state is EmailRequestFailureState) {
            MotionToast.error(description: Text(state.errMessage))
                .show(context);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
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
                      // onsubmit: (value) {
                      //   if (formKey.currentState!.validate()) {
                      //     formKey.currentState!.save();
                      //     cubit.login(
                      //         email: emailController.text,
                      //         password: passwordController.text);
                      //   }
                      // },
                      textinputaction: TextInputAction.done,
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
                                  print('trueee');
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
                          onPressed: () {
                            emailRequest_btmsheet(context, cubit);
                          },
                          child: Text(ENstrings.forgotpassword,
                              style: FontManager.blacktext12.copyWith(
                                  color: ColorsManager.KprimaryColor)),
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
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          cubit.login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: FontManager.greytext12,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: RegisterView(),
                              pageAnimationType: RightToLeftTransition()));
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
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> resetPassword_btmsheet(BuildContext context, AppCubit cubit) {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          maxChildSize: 0.7,
          minChildSize: 0.32,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SizedBox(
                height: 400,
                width: double.infinity,
                // padding: EdgeInsets.all(25.r),
                child: Form(
                  key: formKeyresetphase,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0.r),
                        child: Text(
                          'Forgot password?',
                          style: FontManager.text25,
                        ),
                      ),
                      CustomTextFormFieldWidget(
                        height: 13.h,
                        textfieldHeadername: 'Email ',
                        hinttext: ENstrings.enteremail,
                        controller: forgotemailController,
                        isPassword: false,
                        textInputType: TextInputType.emailAddress,
                        textinputaction: TextInputAction.next,
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
                      CustomTextFormFieldWidget(
                        height: 13.h,
                        textfieldHeadername: 'New Password',
                        hinttext: 'new password',
                        controller: resetPasswordController,
                        isPassword: true,
                        textInputType: TextInputType.text,
                        textinputaction: TextInputAction.done,
                        onsave: (value) {
                          resetPasswordController.text = value!;
                        },
                        onvalidate: (value) {
                          if (value!.length < 8) {
                            return 'Password must be at least 8 characters ';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 105.w),
                        child: CustomButton(
                            text: 'Continue',
                            color: Colors.grey,
                            onpressed: () {
                              if (formKeyresetphase.currentState!.validate()) {
                                formKeyresetphase.currentState!.save();
                                //send
                                // cubit.emailRequest(
                                //     email: forgotemailController.text.trim());

                                Navigator.pop(context);
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
      },
    );
  }

  Future<dynamic> checkOTP_btmsheet(BuildContext context, AppCubit cubit) {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          maxChildSize: 0.7,
          minChildSize: 0.32,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SizedBox(
                height: 400,
                width: double.infinity,
                // padding: EdgeInsets.all(25.r),
                child: Form(
                  key: formKeybtmsheet2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0.r),
                        child: Text(
                          'Forgot password?',
                          style: FontManager.text25,
                        ),
                      ),
                      CustomTextFormFieldWidget(
                        height: 13.h,
                        textfieldHeadername: 'Email',
                        hinttext: ENstrings.enteremail,
                        controller: forgotemailController,
                        isPassword: false,
                        textInputType: TextInputType.emailAddress,
                        textinputaction: TextInputAction.next,
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
                      CustomTextFormFieldWidget(
                        height: 13.h,
                        textfieldHeadername:
                            'Enter OTP (4 digits) code sent to your email.',
                        hinttext: 'enter OTP',
                        controller: otpController,
                        isPassword: false,
                        textInputType: TextInputType.number,
                        textinputaction: TextInputAction.done,
                        onsave: (value) {
                          otpController.text = value!;
                        },
                        onvalidate: (value) {
                          if (value!.length < 4) {
                            return 'enter OTP code correctly';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 105.w),
                        child: CustomButton(
                            text: 'Continue',
                            color: Colors.grey,
                            onpressed: () {
                              if (formKeybtmsheet2.currentState!.validate()) {
                                formKeybtmsheet2.currentState!.save();
                                //send
                                // cubit.otpCheck(
                                //     email: forgotemailController.text,
                                //     otp: otpController.text,
                                //     context: context);

                                Navigator.of(context).pop();
                                resetPassword_btmsheet(context, cubit);
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
      },
    );
  }

  Future<dynamic> emailRequest_btmsheet(BuildContext context, AppCubit cubit) {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.7,
          minChildSize: 0.32,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                // padding: EdgeInsets.all(25.r),
                child: Form(
                  key: formKeybtmsheet1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0.r),
                        child: Text(
                          'Forgot password?',
                          style: FontManager.text25,
                        ),
                      ),
                      CustomTextFormFieldWidget(
                        height: 13.h,
                        textfieldHeadername:
                            'Enter your email for the verification process,we will send 4 digits code to your email.',
                        hinttext: ENstrings.enteremail,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 105.w),
                        child: CustomButton(
                            text: 'Continue',
                            color: Colors.grey,
                            onpressed: () {
                              if (formKeybtmsheet1.currentState!.validate()) {
                                formKeybtmsheet1.currentState!.save();
                                //send
                                // cubit.emailRequest(
                                //     email: forgotemailController.text.trim());
                                // DioHelper.httpPost(email: forgotemailController.text);
                                // DioHelper.DioPost();

                                Navigator.pop(context);
                                checkOTP_btmsheet(context, cubit);
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
      },
    );
  }
}
