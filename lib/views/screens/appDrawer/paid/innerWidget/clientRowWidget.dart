import 'package:flutter/material.dart';
import 'package:thera_track_app/utils/app_colors.dart';

class ClientRowWidget extends StatelessWidget {
  final String name;
  final int amount;
  final String date;
  final String status;

  const ClientRowWidget({
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final borderColor = status == 'paid' ? AppColors.greenColor : Colors.red;
    final textColor = status == 'paid' ? AppColors.greenColor : Colors.red;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text(
                '$amount \$',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
