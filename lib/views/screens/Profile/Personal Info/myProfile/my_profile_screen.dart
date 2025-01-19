
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_list_tile.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() =>
      _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController addressCTRl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Full Name
              Text(AppStrings.fullName,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Bashar Islam ',prefixIcon:SvgPicture.asset(AppIcons.emailIcon)),
              //Email
              Text(AppStrings.email,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
              SizedBox(height: 8.h),
              CustomListTile(title: 'mahafujer@gmail.com',prefixIcon:SvgPicture.asset(AppIcons.emailIcon)),
              // Phone Number
              SizedBox(height: 8.h),
              Text('Phone Number', style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),
              CustomListTile(title: '+44 - 000 -0042'),
              // Address
              SizedBox(height: 8.h),
              Text(AppStrings.address,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Dhaka,Bangladesh',prefixIcon:SvgPicture.asset(AppIcons.emailIcon)),
              SizedBox(height: 30.h),
              CustomButton(
                  onTap: (){
                   // Get.toNamed(AppRoutes.editProfileScreen);
                  },
                  text: AppStrings.editProfile)
            ],
          ),
        ),
      ),
    );
  }

}
