import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/profileController.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/views/base/custom_button.dart';

class CreateNewChartStepFiveScreen extends StatefulWidget {
  @override
  _CreateNewChartStepFiveScreenState createState() =>
      _CreateNewChartStepFiveScreenState();
}

class _CreateNewChartStepFiveScreenState
    extends State<CreateNewChartStepFiveScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  var selectedTreatments = <bool>[].obs; // Track selected checkboxes

  @override
  void initState() {
    super.initState();
    profileController.getAllTreatment().then((_) {
      // Initialize selected states
      selectedTreatments.assignAll(List.generate(
          profileController.getAllTreatMentList.length, (index) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
            Text(
              "Treatments",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: profileController.getAllTreatMentList.length,
                itemBuilder: (context, index) {
                  var treatment =
                  profileController.getAllTreatMentList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            treatment.treatmentTitle,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Obx(() => Checkbox(
                            value: selectedTreatments[index],
                            onChanged: (bool? value) {
                              selectedTreatments[index] = value!;
                            },
                            activeColor: AppColors.primaryColor,
                          )),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.equipmentScreen);
              },
              text: 'Next',
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
