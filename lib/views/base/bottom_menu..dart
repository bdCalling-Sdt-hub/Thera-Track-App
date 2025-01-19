import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../helpers/route.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;
  const BottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.whiteColor : AppColors.blackColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding:  EdgeInsets.only(top: 4.h),
          child: SvgPicture.asset(
            image,
            height: 24.0.h,
            width: 24.0.w,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(menuIndex == 0 ? AppIcons.homeFillUpIcon : AppIcons.homeIconOut, 'Home', theme, 0),
      getItem(menuIndex == 1 ? AppIcons.postNowFillUp : AppIcons.postNow, 'Post Now', theme, 1),
      getItem(menuIndex == 2 ? AppIcons.profileFillUp : AppIcons.profile, 'Profile', theme, 2),
    ];

    return Container(
      decoration: BoxDecoration(
       /*   borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r)),*/
          color: AppColors.primaryColor,
          boxShadow:  [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
              //  Get.offAndToNamed(AppRoutes.homeScreen);
                break;
              case 1:
              //  Get.offAndToNamed(AppRoutes.postNowScreen);
                break;
              case 2:
               // Get.offAndToNamed(AppRoutes.profileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}
