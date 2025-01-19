
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/views/base/custom_button.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.errorImage),
            SizedBox(height: 25.h),
            Text(
              'Oops!',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w900),
            ),

            Text(
              'The page you were looking for can’t be found.',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  onTap: () {
                 //   Get.toNamed(AppRoutes.homeScreen);
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.textColor,
                  text: AppStrings.backToHomePage),
            )
          ],
        ),
      ),
    );
  }
}
