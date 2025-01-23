import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_strings.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';

class EditAnimalContactDetailsScreen extends StatefulWidget {
  const EditAnimalContactDetailsScreen({super.key});

  @override
  State<EditAnimalContactDetailsScreen> createState() =>
      _EditAnimalContactDetailsScreenState();
}

class _EditAnimalContactDetailsScreenState extends State<EditAnimalContactDetailsScreen> {

  final TextEditingController fullNameCTRl = TextEditingController();
  final TextEditingController townCTRl = TextEditingController();
  final TextEditingController postCodeCTRl = TextEditingController();
  final TextEditingController countryCTRl = TextEditingController();
  final TextEditingController emailCTRl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text('Edit Client Information',style:AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.nameText,style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: fullNameCTRl,
                hintText: AppStrings.fullName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),
              //Age'
              SizedBox(height: 8.h),
              Text('Age',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: townCTRl,
                hintText: 'Enter age',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter age";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),
              ///====================>>> Foaling Year
              Text('Foaling Year',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: postCodeCTRl,
                hintText: 'Enter your Foaling Year',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Foaling Year";
                  }
                  return null;
                },
              ),

              SizedBox(height: 8.h),

              //====================>>> Breed
              Text('Breed',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: countryCTRl,
                hintText: 'Enter your Breed',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Breed";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),
              //====================>>> Gender
              Text('Gender',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: countryCTRl,
                hintText: 'Enter your Gender',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Gender";
                  }
                  return null;
                },
              ),

              // Height
              SizedBox(height: 8.h),
              Text('Height',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller:emailCTRl,
                hintText: 'Enter Height',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter height";
                  }
                  return null;
                },
              ),
              // Color
              SizedBox(height: 8.h),
              Text('Color',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller:emailCTRl,
                hintText: 'Enter Color',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Color          ";
                  }
                  return null;
                },
              ),
              // Other
              SizedBox(height: 8.h),
              Text('Other',style: AppStyles.fontSize16(fontWeight:FontWeight.w400,color: AppColors.color424242),),
              SizedBox(height: 8.h),
              CustomTextField(
                controller:emailCTRl,
                hintText: 'Enter Your Other',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Other";
                  }
                  return null;
                },
              ),

              SizedBox(height: 12.h),
              CustomButton(
                  onTap: (){},
                  text: 'Update'),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

}
