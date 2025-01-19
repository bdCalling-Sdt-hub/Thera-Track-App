import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_images.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController passwordCTRl = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.backButton),
          padding: EdgeInsets.all(8.0),
          iconSize: 18.sp,
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.appLogo,width: 72.w,height: 72.h),
                  SizedBox(height: 20.h),
                  Text(AppStrings.loginToYourAccount,style: AppStyles.fontSize24(fontWeight:FontWeight.w700),),
                  Text(AppStrings.welcomeBack,style: AppStyles.fontSize14(fontWeight:FontWeight.w400),),
                  SizedBox(height: 30.h),
                  // Email Text Field
                  Text(AppStrings.yourEmail,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: emailCTRl,
                    hintText: AppStrings.enterEmail,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.emailIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),
                  Text(AppStrings.passwordText,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
                  SizedBox(height: 8.h),
                  // Password Text Field
                  CustomTextField(
                    controller: passwordCTRl,
                    hintText: AppStrings.enterPassword,
                    isPassword: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: SvgPicture.asset(AppIcons.passWordIcon),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  //forgotPassword Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                       //    Get.toNamed(AppRoutes.forgotPasswordScreen);
                        },
                        child: CustomText(
                          fontWeight: FontWeight.bold,
                          text: AppStrings.forgotPassword,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  // Sign In Button
                  SizedBox(height: 20.h),
                  CustomButton(
                    onTap: () {
                     // Get.toNamed(AppRoutes.homeScreen);
                    },
                    text: AppStrings.logIn,
                    textColor: AppColors.whiteColor,
                  ),

                  // Don't Have an Account Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.doNotHaveAnAccount,style: AppStyles.fontSize14()),
                      TextButton(
                        onPressed: () {
                           //Get.toNamed(AppRoutes.signUpScreen);
                        },
                        child: CustomText(
                          text: AppStrings.signUp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // with google
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: AppColors.greyColor),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Text(AppStrings.orLoginWith,
                                style: TextStyle(fontSize: 16, color: AppColors.blackColor),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: AppColors.greyColor,),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 48.w,
                          height: 48.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.buttonColor,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2.0.w,
                            ),
                          ),
                          child: ClipOval(
                            child: Padding(
                              padding:  EdgeInsets.all(8.0.r),
                              child: SvgPicture.asset(AppIcons.googleIcon),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
