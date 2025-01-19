
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============================> AppBar Section <=======================
      appBar: AppBar(
        title: Text(
          AppStrings.notificationText,
          style: AppStyles.fontSize16(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.backButton),
          padding: EdgeInsets.all(8.0),
          iconSize: 18.sp,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      //=============================> Body Section <=========================
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            title: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 12),
            ),
            leading: SizedBox(
              height: 50.h,
              width: 50.w,
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.likeColor,
                ),
                child: Icon(
                  Icons.notifications,
                  color: AppColors.whiteColor,
                  size: 27, // Adjust the size of the icon
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
