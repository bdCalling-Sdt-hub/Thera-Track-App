
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController addressCTRl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(AppStrings.editPersonalInfo,style:AppStyles.fontSize16()),
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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Full Name
              Text(AppStrings.fullName,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: fullNameCTRl,
                hintText: AppStrings.fullName,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: SvgPicture.asset(AppIcons.personIcon),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              //Email
              SizedBox(height: 8.h),
              Text(AppStrings.email,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
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

              // Phone Number
              SizedBox(height: 8.h),
              Text(AppStrings.phoneNumber, style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: AppStrings.enterPhoneNumber,
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  ),
                ),
                showCountryFlag: true,
                initialCountryCode: 'US',
                flagsButtonMargin: EdgeInsets.only(left: 10.w),
                disableLengthCheck: true,
                dropdownIconPosition: IconPosition.trailing,
                onChanged: (phone) {
                  print("Phone===============> ${phone.completeNumber}");
                },
              ),

              // Address
              SizedBox(height: 8.h),
              Text(AppStrings.address,style: AppStyles.fontSize16(fontWeight:FontWeight.w700),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: addressCTRl,
                hintText: 'Dhaka,Bangladesh',
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: SvgPicture.asset(AppIcons.locationIcon),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30.h),
              CustomButton(
                  onTap: (){},
                  text: AppStrings.updateProfile)
            ],
          ),
        ),
      ),
    );
  }

}
