import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/screens/Home/wallet/innerWidget/costRowWidget.dart';

class WalletDetailsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clients = [
    {'departure': 'Client 01','destination' : 'Dhaka', 'distance': '15 Km', 'totalCost':  2025},
    {'departure': 'Client 01','destination' : 'Dhaka', 'distance': '15 Km', 'totalCost':  2025},
    {'departure': 'Client 01','destination' : 'Dhaka', 'distance': '15 Km', 'totalCost':  2025},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cost',style: AppStyles.fontSize16(),),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
                onTap: (){
                  Get.toNamed(AppRoutes.costAddScreen);
                },
                width: 50.w,
                text: 'Add New'

            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    final client = clients[index];
                    return CostRowWidget(
                      departure: client['departure'],
                      destination: client['destination'],
                      distance: client['distance'],
                      totalCost: client['totalCost'],
                    );

                  }
              ),

            ),

            _buildEmailInputSection(),
          ],
        ),
      ),
    );
  }



  Widget _buildEmailInputSection() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
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
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 12.h),
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
                  label: Text('Send', style: TextStyle(color: AppColors.whiteColor)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
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
