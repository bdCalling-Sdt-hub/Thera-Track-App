import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/price_details_row.dart';

import '../innerWidget/detailsRow_widget.dart';

class CreateNewChartStepSixScreen extends StatefulWidget {
  @override
  _CreateNewChartStepSixScreenState createState() =>
      _CreateNewChartStepSixScreenState();
}

class _CreateNewChartStepSixScreenState extends State<CreateNewChartStepSixScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 6',
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

            PriceDetailWidget(title: 'Cryotherapy', price: '200'),
            PriceDetailWidget(title: 'Hydrotherapy', price: '200'),
            PriceDetailWidget(title: 'Laser Therapy', price:'200'),
            PriceDetailWidget(title: 'Osteopathy ', price: '200'),

            Divider(color: AppColors.blackColor),
            PriceDetailWidget(title: 'Full Cost ', price: '800'),
            PriceDetailWidget(title: 'Discount ', price: '80'),
            PriceDetailWidget(title: 'Final Cost ', price: '720'),
            SizedBox(height: 20.h),
            // Next Button
            CustomButton(onTap: () {
              Get.toNamed(AppRoutes.createNewChartDetailsScreen);
            }, text: 'Next'),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
