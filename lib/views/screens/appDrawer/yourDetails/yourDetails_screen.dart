import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/profileController.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_list_tile.dart';

class YourDetailsScreen extends StatefulWidget {
  const YourDetailsScreen({super.key});

  @override
  State<YourDetailsScreen> createState() => _YourDetailsScreenState();
}

class _YourDetailsScreenState extends State<YourDetailsScreen> {

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _profileController.getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============================> AppBar Section <=======================
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Your Details',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx((){
      var profileData = _profileController.profileInformationModel.value;
      if (_profileController.isLoading.value) {
        return Center(child: CupertinoActivityIndicator(radius: 32.r, color:AppColors.primaryColor));
      }
      return
      SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                //Full Name
                Text(AppStrings.nameText,style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.firstName  ?? 'N/A'),
                //Town
                Text('Town/City',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.city  ?? 'N/A'),
                //PostCode
                Text('Postcode', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.postCode  ?? 'N/A'),
                //Country
                Text('Country', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.country  ?? 'N/A'),
                // Mobile
                SizedBox(height: 8.h),
                Text('Mobile', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.phoneNumber  ?? 'N/A'),
                // Email
                SizedBox(height: 8.h),
                Text('Main Email Address',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242)),
                SizedBox(height: 8.h),
                CustomListTile(title: profileData.email  ?? 'N/A'),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        );
      }
    ));
  }

}
