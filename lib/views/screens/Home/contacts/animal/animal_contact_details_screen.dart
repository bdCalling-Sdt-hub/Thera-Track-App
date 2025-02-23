import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_list_tile.dart';

class AnimalContactDetailsScreen extends StatefulWidget {
  const AnimalContactDetailsScreen({super.key});

  @override
  State<AnimalContactDetailsScreen> createState() => _AnimalContactDetailsScreenState();
}

class _AnimalContactDetailsScreenState extends State<AnimalContactDetailsScreen> {
  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController addressCTRl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      //=============================> AppBar Section <=======================
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Animal Name',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.h),
            child: InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.editAnimalContactDetailsScreen);
                },
                child: SvgPicture.asset(AppIcons.editIcon,color:AppColors.blackColor)),
          ),
        ],
      ),
      //=======================================>> Body Section <<===============================
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              //Full Name
              Text(AppStrings.nameText,style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomListTile(title: 'My Horse'),
              //Age
              Text('Age',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomListTile(title: '3 years 2 month'),
              //Foaling Year
              Text('Foaling Year', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: '2025'),
              //Breed
              Text('Breed', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Twoooo'),
              // Gender
              SizedBox(height: 8.h),
              Text('Gender', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Male'),
              // Height
              SizedBox(height: 8.h),
              Text('Height',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: '68 inches'),
              //Color
              Text('Color', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Black'),
              //Other
              Text('Other', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Empty'),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

}
