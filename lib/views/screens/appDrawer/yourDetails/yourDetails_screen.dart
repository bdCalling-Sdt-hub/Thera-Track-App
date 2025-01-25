import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();
  final TextEditingController addressCTRl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============================> AppBar Section <=======================
      appBar: AppBar(
        title: Text(
          'Your Details',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
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
              CustomListTile(title: 'Md. Nurunnabi'),
              //Town
              Text('Town/City',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Dhaka'),
              //PostCode
              Text('Postcode', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: '12300'),
              //Country
              Text('Country', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'USA'),
              // Mobile
              SizedBox(height: 8.h),
              Text('Mobile', style: AppStyles.fontSize16(fontWeight: FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: '+44 - 000 -0042'),
              // Email
              SizedBox(height: 8.h),
              Text('Main Email Address',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242)),
              SizedBox(height: 8.h),
              CustomListTile(title: 'Dhaka,Bangladesh'),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

}
