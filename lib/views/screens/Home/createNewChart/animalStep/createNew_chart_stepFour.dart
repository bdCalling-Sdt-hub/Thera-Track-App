import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';
import 'package:thera_track_app/views/base/dotted_border_container.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/innerWidget/addpoint_textBox.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/customHeaderWithSearch_widget.dart';

class CreateNewChartStepFourScreen extends StatefulWidget {
  @override
  _CreateNewChartStepFourScreenState createState() => _CreateNewChartStepFourScreenState();
}

class _CreateNewChartStepFourScreenState extends State<CreateNewChartStepFourScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController addType = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 4',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Select the Area of Concern',style: AppStyles.fontSize18(fontWeight: FontWeight.w500)),
            Text('Select one or more areas. If unsure select Other.',style: AppStyles.fontSize14(color: AppColors.color424242)),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
                child: DottedBorderContainer(
                  child: Container(
                    height: 200.h,
                    child: Center(
                        child: Text('Click to browse or \ndrag and drop your files',textAlign: TextAlign.center)),
                  )
                ),
              ),
           /*  Row(
                children: [
                  CustomTextField(
                    controller: addType,
                    hintText: 'Enter age',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter age";
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    width: 80.w,
                    onTap: (){}, text: 'Next'),
                ],
              ),*/

              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.w),
                      child: Text(
                          'Description',
                          style: AppStyles.fontSize18(color: AppColors.color575757)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                              Text(
                                '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                              Text(
                                '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppStyles.fontSize14(color: AppColors.color575757),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Recent Clients section
              SizedBox(height: 10.h),
              TextBoxList(),
              SizedBox(height: 10.h),
              CustomButton(onTap: (){}, text: 'Next'),
              SizedBox(height: 10.h),

            ],
          ),
        ),
      ),
    );
  }
}
