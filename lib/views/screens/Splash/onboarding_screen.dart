
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_background.dart';
import '../../base/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                //=============================> Onboarding Img Section <========================
                SizedBox(height: 80.h),
                Text(AppStrings.receiveDivineText,
                  style: AppStyles.onboardingScreenNormalText(
                      color: AppColors.textColor),
                ),
                Text(AppStrings.anytimeText,
                  style: AppStyles.onboardingScreen(color: AppColors.textColor),
                ),
                //=============================> GET STARTED Button <========================
                SizedBox(height: 12.h),
                CustomButton(
                  textColor: AppColors.textColor,
                  onTap: () {
                   //   Get.toNamed(AppRoutes.signInScreen);
                  },
                  text: AppStrings.signIn,
                ),
                SizedBox(height: 8.h),
                CustomButton(
                  color: AppColors.buttonColor,
                  textColor: AppColors.primaryColor,
                  onTap: () {
                    //  Get.toNamed(AppRoutes.signUpScreen);
                  },
                  text: AppStrings.signUp,
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColors.textColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                                AppStrings.orLoginWith,
                              style: TextStyle(fontSize: 16, color: AppColors.textColor),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: AppColors.textColor,),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.buttonColor,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2.0,
                          ),
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
    );
  }
}
