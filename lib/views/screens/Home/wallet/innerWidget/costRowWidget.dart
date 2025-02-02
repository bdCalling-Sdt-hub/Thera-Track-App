import 'package:flutter/material.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';

class CostRowWidget extends StatelessWidget {
  final String departure;
  final String destination;
  final String distance;
  final int totalCost;

  const CostRowWidget({
    required this.departure,
    required this.destination,
    required this.distance,
    required this.totalCost,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                departure,
                  style: AppStyles.fontSize16(color: AppColors.color707070)
              ),
              Text(
                destination,
                  style: AppStyles.fontSize16(color: AppColors.color707070)
              ),
              Text(
                distance,
                  style: AppStyles.fontSize16(color: AppColors.color707070)
              ),
              Text(
                '$totalCost \$',
                  style: AppStyles.fontSize16(color: AppColors.color707070)
              ),
            ],
          ),
        ),
      ],
    );
  }
}
