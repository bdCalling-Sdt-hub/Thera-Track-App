import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/profileController.dart';
import 'package:thera_track_app/helpers/time_formate.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/appDrawer/paid/innerWidget/clientRowWidget.dart';

class PaidDetailsScreen extends StatefulWidget {
  @override
  State<PaidDetailsScreen> createState() => _PaidDetailsScreenState();
}

class _PaidDetailsScreenState extends State<PaidDetailsScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getAllPaidTreatmentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paid',
          style: AppStyles.fontSize16(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => profileController.getAllPaidTreatmentModels.isEmpty
                  ? Center(child: Text('No paid treatments added yet.', style: TextStyle(color: Colors.black)))
                  : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: profileController.getAllPaidTreatmentModels.length,
                        itemBuilder: (context, index) {
                      final displayData = profileController.getAllPaidTreatmentModels[index];
                      return ClientRowWidget(
                        status: 'paid',
                        name: displayData.name ?? 'N/A',
                        date: TimeFormatHelper.formatDate(DateTime.parse(displayData.createdAt.toString())),
                        amount: int.parse(displayData.finalCost.toString()),
                      );
                      },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(12.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  TimeFormatHelper.formatDate(DateTime.now()),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Obx(
                                  () => Text(
                                '${profileController.paidTotalFinalCost} \$',
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
          ),
          _buildEmailInputSection(),
        ],
      ),
    );
  }

  Widget _buildEmailInputSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter email here',
                hintStyle: AppStyles.fontSize14(color: AppColors.greyColor),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Data will be sent to the email above.',
              style: TextStyle(color: AppColors.blackColor),
            ),
            SizedBox(height: 16.h),
            Center(
              child: SizedBox(
                width: 194.w,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send, color: AppColors.whiteColor),
                  label: Text('Send',
                      style: TextStyle(color: AppColors.whiteColor)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
