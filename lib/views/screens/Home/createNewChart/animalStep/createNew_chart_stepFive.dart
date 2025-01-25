import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/views/base/custom_button.dart';

class CreateNewChartStepFiveScreen extends StatefulWidget {
  @override
  _CreateNewChartStepFiveScreenState createState() =>
      _CreateNewChartStepFiveScreenState();
}

class _CreateNewChartStepFiveScreenState
    extends State<CreateNewChartStepFiveScreen> {
  List<Map<String, dynamic>> treatments = [
    {"name": "Cryotherapy", "isChecked": false},
    {"name": "Hydrotherapy", "isChecked": false},
    {"name": "Laser Therapy", "isChecked": false},
    {"name": "Osteopathy", "isChecked": false},
  ];

  void addNewTreatment() {
    setState(() {
      treatments.add({"name": "New Treatment", "isChecked": false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 5',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Treatments",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: addNewTreatment,
                  icon: SvgPicture.asset(
                    AppIcons.addIcon,
                    height: 25.h,
                    width: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Treatments List
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: treatments.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50.h,
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: AppColors.primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          treatments[index]['name'],
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.primaryColor,
                            value: treatments[index]['isChecked'],
                            onChanged: (value) {
                              setState(() {
                                treatments[index]['isChecked'] = value;
                              });
                            },

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            side: BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Next Button
            CustomButton(onTap: () {
              Get.toNamed(AppRoutes.createNewChartStepSixScreen);
            }, text: 'Next'),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
