import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_list_tile.dart';
import 'package:thera_track_app/views/base/price_details_row.dart';
import 'package:thera_track_app/views/screens/Home/wallet/innerWidget/costDetailsWidget.dart';

class CostDetailsScreen extends StatefulWidget {
  @override
  State<CostDetailsScreen> createState() => _CostDetailsScreenState();
}

class _CostDetailsScreenState extends State<CostDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cost Review',style: AppStyles.fontSize16(color: AppColors.color575757)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostDetailsWidget(title: 'Departure', value: 'Rangpur'),
              CostDetailsWidget(title: 'Destination', value: 'Dhaka'),
              CostDetailsWidget(title: 'Distance', value: '200 Km'),
              CostDetailsWidget(title: 'Food', value: '200 \$'),
              CostDetailsWidget(title: 'Gas', value: '200 \$'),
              CostDetailsWidget(title: 'Other', value: '200 \$'),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.w),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: double.infinity,
                    height: 200.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                        imageUrl: "https://finicalholdings.com/wp-content/uploads/2021/06/Customer-at-the-checkout-paying-with-credit-card-on-the-payment-terminal.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
        
              _buildEmailInputSection(),
            ],
          ),
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
