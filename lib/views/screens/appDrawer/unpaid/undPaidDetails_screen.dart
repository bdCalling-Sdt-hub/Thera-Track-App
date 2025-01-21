import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/appDrawer/paid/innerWidget/clientRowWidget.dart';

class UnPaidDetailsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clients = [
    {'name': 'Client 01', 'amount': 150, 'date': '14 jan 2025'},
    {'name': 'Client 02', 'amount': 150, 'date': '14 jan 2025'},
    {'name': 'Client 03', 'amount': 150, 'date': '14 jan 2025'},
    {'name': 'Client 04', 'amount': 150, 'date': '14 jan 2025'},
    {'name': 'Client 05', 'amount': 150, 'date': '14 jan 2025'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unpaid',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                  final client = clients[index];
                  return ClientRowWidget(
                    status: 'unpaid',
                    name: client['name'],
                    date: client['date'],
                    amount: 200,
                  );

                }
            ),

          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(12),

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
                      '20 Jan 2025',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '9000 \$',
                  style: TextStyle(
                    color: AppColors.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildEmailInputSection(),
        ],
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
          color: AppColors.colorBADEFB,
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
