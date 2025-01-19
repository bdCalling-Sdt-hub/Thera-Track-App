import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_images.dart';
import '../../base/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 400.h),
                Image.asset(
                  AppImages.appLogo,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 40.h),
                // GET STARTED Button
                CustomButton(
                  textColor: AppColors.textColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.signInScreen);
                  },
                  text: 'Get Started',
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
