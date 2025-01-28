import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';

class PriceDetailWidget extends StatelessWidget {
  final String title;
  final String price;

  const PriceDetailWidget({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppStyles.fontSize16(color: AppColors.color424242),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Separator ":"
          Text(
            ':',
            style: AppStyles.fontSize16(color: AppColors.color424242),
          ),

          SizedBox(width: 10.w),

          // Fixed width container for price
          Container(
            width: 80.w,
            alignment: Alignment.centerRight,
            child: Text(
              '$price \$',
              style: AppStyles.fontSize16(color: AppColors.color424242),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
