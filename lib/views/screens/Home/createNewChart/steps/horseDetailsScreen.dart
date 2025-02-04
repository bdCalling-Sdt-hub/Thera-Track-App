

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/detailsRow_widget.dart';

class HorseDetailsScreen extends StatefulWidget {
  @override
  State<HorseDetailsScreen> createState() => _HorseDetailsScreenState();
}

class _HorseDetailsScreenState extends State<HorseDetailsScreen> {
  TextEditingController addAnimal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horse Details',style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horse Details
            DetailRow(titelText: 'Age', value: '5 years',),
            DetailRow(titelText: 'Breed', value: 'Thomas Anree',),
            DetailRow(titelText: 'Gender', value: 'Male',),
            DetailRow(titelText: 'Height', value: '5 ft',),
            DetailRow(titelText: 'Color', value: 'Black',),

              // Selection Animal
            SizedBox(height: 20.h),
              Text('Select animal', style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(onTap: (){}, text: 'Horse')
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(onTap: (){}, text: 'Dog')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(controller: addAnimal),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 60.h,
                    width: 80.w,
                    child: CustomButton(onTap: () {}, text: 'Add'),
                  ),
                ],
              ),
            SizedBox(height: 20.h),
            CustomButton(onTap: (){}, text: 'Done')
          ],
        ),
      ),
    );
  }

}
