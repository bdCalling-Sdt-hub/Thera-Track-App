import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/views/base/custom_list_tile.dart';

import '../../../../utils/app_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settingText,style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.backButton),
          padding: EdgeInsets.all(8.0),
          iconSize: 18.sp,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4.h),
              child: CustomListTile(
                onTap: (){
                 // Get.toNamed(AppRoutes.changePasswordScreen);
                },
                title: 'Change Password',
                prefixIcon: SvgPicture.asset(AppIcons.passWordIcon),
                suffixIcon:  SvgPicture.asset(AppIcons.arrowIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4.h),
              child: CustomListTile(
                onTap: (){
                 // Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                title: 'Privacy policy',
                prefixIcon: SvgPicture.asset(AppIcons.settingsIcon),
                suffixIcon:  SvgPicture.asset(AppIcons.arrowIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4.h),
              child: CustomListTile(
                onTap: (){
                  //Get.toNamed(AppRoutes.termsandConditionsScreen);
                },
                title: 'Terms & conditions',
                prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                suffixIcon:  SvgPicture.asset(AppIcons.arrowIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4.h),
              child: CustomListTile(
                onTap: (){
                //  Get.toNamed(AppRoutes.aboutUsScreen);
                },
                title: 'About Us',
                prefixIcon: SvgPicture.asset(AppIcons.settingsIcon),
                suffixIcon:  SvgPicture.asset(AppIcons.arrowIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4.h),
              child: CustomListTile(
                onTap: (){
                //  Get.toNamed(AppRoutes.supportScreen);
                },
                title: 'Support',
                prefixIcon: SvgPicture.asset(AppIcons.supportIcon),
                suffixIcon:  SvgPicture.asset(AppIcons.arrowIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
